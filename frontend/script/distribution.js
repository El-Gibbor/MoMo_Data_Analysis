const DISTR_API_ENDPOINT = 'https://momo-data-analysis.onrender.com/api/summary/grouped';

// Transaction data populated from API
let transactionData = {
    deposits: {},
    payments: {}
};

let depositPieChart, paymentPieChart, comparisonChart;

// Color palettes
const depositColors = [
    '#FF6B6B', '#4ECDC4', '#45B7D1', '#96CEB4', '#FFEAA7',
    '#DDA0DD', '#98D8C8', '#F7DC6F', '#BB8FCE', '#85C1E9'
];

const paymentColors = [
    '#6C5CE7', '#A29BFE', '#FD79A8', '#FDCB6E', '#6C5CE7',
    '#E17055', '#81ECEC', '#55A3FF', '#FF7675', '#74B9FF'
];

function formatCurrency(amount) {
    return new Intl.NumberFormat('rw-RW', {
        style: 'currency',
        currency: 'RWF',
        minimumFractionDigits: 0
    }).format(amount);
}

function formatCompactCurrency(amount) {
    if (amount >= 1000000000) {
        return 'RWF ' + (amount / 1000000000).toFixed(1) + 'B';
    } else if (amount >= 1000000) {
        return 'RWF ' + (amount / 1000000).toFixed(1) + 'M';
    } else if (amount >= 1000) {
        return 'RWF ' + (amount / 1000).toFixed(0) + 'K';
    } else {
        return 'RWF ' + amount.toLocaleString();
    }
}

async function loadDataFromAPI() {

    try {
        const response = await fetch(DISTR_API_ENDPOINT);

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const apiData = await response.json();

        // Validate the API response structure
        if (!apiData || typeof apiData !== 'object') {
            throw new Error('Invalid API response format');
        }

        // Check if the response has deposits and payments properties
        if (!apiData.deposits && !apiData.payments) {
            // If the API returns data in a different format, try to adapt it
            console.log('API Response:', apiData);
            throw new Error('API response must contain deposits and/or payments data');
        }

        // Update transaction data with API response
        transactionData = {
            deposits: apiData.deposits || {},
            payments: apiData.payments || {}
        };

        // Ensure we have some data to display
        if (Object.keys(transactionData.deposits).length === 0 &&
            Object.keys(transactionData.payments).length === 0) {
            throw new Error('No transaction data received from API');
        }

        // Update all visualizations
        updateAllCharts();

        console.log('Data loaded successfully from API');

    } catch (error) {
        console.error('Error loading data from API:', error);
        showError(`Failed to load data: ${error.message}`);
    } finally {
        // hideIsLoading();
    }
}

function updateOverviewStats() {
    // Calculate deposit totals
    const depositEntries = Object.values(transactionData.deposits);
    const totalDepositVolume = depositEntries.reduce((sum, item) => sum + (item.amount || 0), 0);
    const totalDepositCount = depositEntries.reduce((sum, item) => sum + (item.count || 0), 0);

    // Calculate payment totals
    const paymentEntries = Object.values(transactionData.payments);
    const totalPaymentVolume = paymentEntries.reduce((sum, item) => sum + (item.amount || 0), 0);
    const totalPaymentCount = paymentEntries.reduce((sum, item) => sum + (item.count || 0), 0);

    // Update deposit stats
    document.getElementById('totalDepositVolume').textContent = formatCurrency(totalDepositVolume);
    document.getElementById('totalDepositCount').textContent = totalDepositCount.toLocaleString();
    document.getElementById('avgDepositAmount').textContent = totalDepositCount > 0 ?
        formatCurrency(totalDepositVolume / totalDepositCount) : 'RWF 0';

    // Update payment stats
    document.getElementById('totalPaymentVolume').textContent = formatCurrency(totalPaymentVolume);
    document.getElementById('totalPaymentCount').textContent = totalPaymentCount.toLocaleString();
    document.getElementById('avgPaymentAmount').textContent = totalPaymentCount > 0 ?
        formatCurrency(totalPaymentVolume / totalPaymentCount) : 'RWF 0';

    // Update net flow stats
    const netVolume = totalDepositVolume - totalPaymentVolume;
    const totalVolume = totalDepositVolume + totalPaymentVolume;
    const depositRatio = totalVolume > 0 ? (totalDepositVolume / totalVolume * 100).toFixed(1) : '0';
    const paymentRatio = totalVolume > 0 ? (totalPaymentVolume / totalVolume * 100).toFixed(1) : '0';

    document.getElementById('netVolume').textContent = formatCurrency(netVolume);
    document.getElementById('depositRatio').textContent = depositRatio + '%';
    document.getElementById('paymentRatio').textContent = paymentRatio + '%';
}


function createPieChart(canvasId, data, colors, title) {
    const ctx = document.getElementById(canvasId).getContext('2d');

    // Check if data exists and has items
    if (!data || Object.keys(data).length === 0) {
        // Clear the canvas if no data
        ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
        return;
    }

    const labels = Object.keys(data);
    const amounts = Object.values(data).map(item => item.amount || 0);

    // Destroy existing chart
    if (canvasId === 'depositPieChart' && depositPieChart) {
        depositPieChart.destroy();
    }
    if (canvasId === 'paymentPieChart' && paymentPieChart) {
        paymentPieChart.destroy();
    }

    const chart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: labels,
            datasets: [{
                data: amounts,
                backgroundColor: colors,
                borderWidth: 0,
                hoverBorderWidth: 0,
                hoverOffset: 10
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    backgroundColor: 'rgba(0,0,0,0.8)',
                    titleColor: 'white',
                    bodyColor: 'white',
                    cornerRadius: 8,
                    padding: 12,
                    callbacks: {
                        label: function (context) {
                            const total = context.dataset.data.reduce((a, b) => a + b, 0);
                            const percentage = total > 0 ? ((context.parsed / total) * 100).toFixed(1) : '0';
                            return `${context.label}: ${formatCurrency(context.parsed)} (${percentage}%)`;
                        }
                    }
                }
            },
            cutout: '60%',
            animation: {
                animateRotate: true,
                duration: 1000
            }
        }
    });

    if (canvasId === 'depositPieChart') {
        depositPieChart = chart;
        createCustomLegend('depositLegend', data, colors);
    } else {
        paymentPieChart = chart;
        createCustomLegend('paymentLegend', data, colors);
    }
}

function createCustomLegend(containerId, data, colors) {
    const container = document.getElementById(containerId);
    container.innerHTML = '';

    if (!data || Object.keys(data).length === 0) {
        container.innerHTML = '<div class="legend-item">No data available</div>';
        return;
    }

    const total = Object.values(data).reduce((sum, item) => sum + (item.amount || 0), 0);

    Object.keys(data).forEach((key, index) => {
        const item = data[key];
        const percentage = total > 0 ? ((item.amount / total) * 100).toFixed(1) : '0';

        const legendItem = document.createElement('div');
        legendItem.className = 'legend-item';

        legendItem.innerHTML = `
                    <div class="legend-left">
                        <div class="legend-color" style="background-color: ${colors[index % colors.length]}"></div>
                        <span>${key}</span>
                    </div>
                    <div class="legend-value">${percentage}%</div>
                `;

        container.appendChild(legendItem);
    });
}

function createComparisonChart() {
    const ctx = document.getElementById('comparisonChart').getContext('2d');

    if (comparisonChart) {
        comparisonChart.destroy();
    }

    // Get all unique transaction types
    const allTypes = [...new Set([...Object.keys(transactionData.deposits), ...Object.keys(transactionData.payments)])];

    if (allTypes.length === 0) {
        return;
    }

    // Prepare data for deposits and payments
    const depositVolumes = allTypes.map(type => transactionData.deposits[type]?.amount || 0);
    const paymentVolumes = allTypes.map(type => transactionData.payments[type]?.amount || 0);
    const depositCounts = allTypes.map(type => transactionData.deposits[type]?.count || 0);
    const paymentCounts = allTypes.map(type => transactionData.payments[type]?.count || 0);

    comparisonChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: allTypes,
            datasets: [
                {
                    label: 'Deposit Volume',
                    data: depositVolumes,
                    backgroundColor: '#22C55E',
                    borderColor: '#16A34A',
                    borderWidth: 1,
                    yAxisID: 'y',
                    order: 2
                },
                {
                    label: 'Payment Volume',
                    data: paymentVolumes,
                    backgroundColor: '#EF4444',
                    borderColor: '#DC2626',
                    borderWidth: 1,
                    yAxisID: 'y',
                    order: 3
                },
                {
                    type: 'line',
                    label: 'Deposit Count',
                    data: depositCounts,
                    borderColor: '#059669',
                    backgroundColor: 'rgba(5, 150, 105, 0.1)',
                    borderWidth: 3,
                    fill: false,
                    tension: 0.4,
                    pointBackgroundColor: '#059669',
                    pointBorderColor: '#ffffff',
                    pointBorderWidth: 2,
                    pointRadius: 5,
                    pointHoverRadius: 7,
                    yAxisID: 'y1',
                    order: 0
                },
                {
                    type: 'line',
                    label: 'Payment Count',
                    data: paymentCounts,
                    borderColor: '#B91C1C',
                    backgroundColor: 'rgba(185, 28, 28, 0.1)',
                    borderWidth: 3,
                    fill: false,
                    tension: 0.4,
                    pointBackgroundColor: '#B91C1C',
                    pointBorderColor: '#ffffff',
                    pointBorderWidth: 2,
                    pointRadius: 5,
                    pointHoverRadius: 7,
                    yAxisID: 'y1',
                    order: 1
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            interaction: {
                mode: 'index',
                intersect: false,
            },
            plugins: {
                legend: {
                    position: 'top',
                    labels: {
                        usePointStyle: true,
                        padding: 20,
                        font: {
                            size: 13,
                            weight: '600'
                        }
                    }
                },
                tooltip: {
                    backgroundColor: 'rgba(0,0,0,0.9)',
                    titleColor: 'white',
                    bodyColor: 'white',
                    borderColor: 'rgba(255,255,255,0.2)',
                    borderWidth: 1,
                    cornerRadius: 8,
                    padding: 12,
                    titleFont: {
                        size: 14,
                        weight: 'bold'
                    },
                    bodyFont: {
                        size: 13
                    },
                    callbacks: {
                        title: function (tooltipItems) {
                            return tooltipItems[0].label;
                        },
                        label: function (context) {
                            const datasetLabel = context.dataset.label;
                            if (datasetLabel.includes('Volume')) {
                                return `${datasetLabel}: ${formatCurrency(context.parsed.y)}`;
                            } else {
                                return `${datasetLabel}: ${context.parsed.y.toLocaleString()}`;
                            }
                        }
                    }
                }
            },
            scales: {
                x: {
                    grid: {
                        display: false,
                        drawBorder: false
                    },
                    ticks: {
                        maxRotation: 45,
                        minRotation: 0,
                        color: '#6B7280',
                        font: {
                            size: 11,
                            weight: '500'
                        }
                    }
                },
                y: {
                    type: 'linear',
                    display: true,
                    position: 'left',
                    title: {
                        display: true,
                        text: 'Transaction Volume',
                        color: '#374151',
                        font: {
                            size: 14,
                            weight: '500'
                        }
                    },
                    grid: {
                        display: true,
                        color: 'rgba(0,0,0,0.05)',
                        drawBorder: false
                    },
                    ticks: {
                        color: '#6B7280',
                        font: {
                            size: 12
                        },
                        callback: function (value) {
                            return formatCompactCurrency(value);
                        }
                    }
                },
                y1: {
                    type: 'linear',
                    display: true,
                    position: 'right',
                    title: {
                        display: true,
                        text: 'Transaction Count',
                        color: '#374151',
                        font: {
                            size: 14,
                            weight: '500'
                        }
                    },
                    grid: {
                        drawOnChartArea: false,
                        color: 'rgba(0,0,0,0.05)',
                        drawBorder: false
                    },
                    ticks: {
                        color: '#6B7280',
                        font: {
                            size: 12
                        },
                        callback: function (value) {
                            return value.toLocaleString();
                        }
                    }
                }
            },
            animation: {
                duration: 1000,
                easing: 'easeInOutQuart'
            }
        }
    });
}

function updateAllCharts() {
    updateOverviewStats();
    createPieChart('depositPieChart', transactionData.deposits, depositColors, 'Deposits');
    createPieChart('paymentPieChart', transactionData.payments, paymentColors, 'Payments');
    createComparisonChart();
}

// Initialize the dashboard (empty until API data is loaded)
updateAllCharts();

// Automatically load data from API on page load
window.addEventListener('load', function () {
    // Add a small delay to ensure the page is fully rendered
    setTimeout(loadDataFromAPI, 1000);
});
