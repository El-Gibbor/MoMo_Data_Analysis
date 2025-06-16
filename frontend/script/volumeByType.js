let chartData = [];
let currentChart = null;
let currentChartType = 'line';
let isChartLoading = false;

// color palette for Chart.js
const chartColors = [
    '#003f5a', '#fcca0a', '#e74c3c', '#2ecc71',
    '#9b59b6', '#f39c12', '#1abc9c', '#34495e',
    '#e67e22', '#95a5a6', '#d35400', '#8e44ad'
];

const BASE_URL = 'https://momo-data-analysis.onrender.com';
const API_ENDPOINT = '/api/summary/vol-by-type';

// Initialize chart on page load
document.addEventListener('DOMContentLoaded', function () {
    loadChartData();
});

async function loadChartData() {
    if (isChartLoading) return;

    isChartLoading = true;
    const loading = document.getElementById('loading');
    const canvas = document.getElementById('transactionChart');
    const refreshBtn = document.getElementById('filter-btn');
    const statusIndicator = document.getElementById('data-status');

    // Update UI for loading state
    loading.style.display = 'flex';
    canvas.style.display = 'none';
    refreshBtn.disabled = true;
    statusIndicator.style.display = 'none';

    try {
        const dateFrom = document.getElementById('date-from').value;
        const dateTo = document.getElementById('date-to').value;

        const params = new URLSearchParams();
        if (dateFrom) params.append('date_from', dateFrom);
        if (dateTo) params.append('date_to', dateTo);

        const queryString = params.toString();
        const url = `${BASE_URL}${API_ENDPOINT}${queryString ? `?${queryString}` : ''}`;

        console.log('Fetching data from:', url);

        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            mode: 'cors'
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status} - ${response.statusText}`);
        }

        const data = await response.json();

        if (data.error) {
            throw new Error(data.error);
        }

        // Filter out any invalid entries and sort by volume (highest first)
        chartData = data
            .filter(item => item.transaction_type && item.total_volume !== undefined && item.total_volume !== null)
            .map(item => ({
                transaction_type: item.transaction_type.trim(), // Clean up transaction type
                total_volume: parseFloat(item.total_volume) // Ensure it's a number
            }))
            .sort((a, b) => b.total_volume - a.total_volume);

        // console.log('Successfully loaded data:', chartData);

    } catch (error) {
        console.error('Error loading chart data:', error);

        // Clear chart data on error
        chartData = [];

        // Show error status
        statusIndicator.className = 'status-indicator status-error';
        statusIndicator.innerHTML = `Failed to load data - Error: ${error.message}`;
        statusIndicator.style.display = 'inline-flex';
    }

    // Update UI and render chart
    loading.style.display = 'none';
    canvas.style.display = 'block';
    refreshBtn.disabled = false;
    isChartLoading = false;

    renderChart();
    updateSummary();
}

function switchChartType(type) {
    currentChartType = type;

    // Update tab buttons
    document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
    event.target.classList.add('active');

    renderChart();
}

function renderChart() {
    const ctx = document.getElementById('transactionChart').getContext('2d');

    // Destroy existing chart
    if (currentChart) {
        currentChart.destroy();
    }

    // Show empty state message when theres no data
    if (!chartData || chartData.length === 0) {
        ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
        ctx.font = '16px Arial';
        ctx.fillStyle = '#666';
        ctx.textAlign = 'center';
        ctx.fillText('There\'s no available transaction!', ctx.canvas.width / 2, ctx.canvas.height / 2);
        return;
    }

    const labels = chartData.map(item => item.transaction_type);
    const data = chartData.map(item => item.total_volume);
    const colors = chartData.map((_, index) => chartColors[index % chartColors.length]);

    const config = {
        type: currentChartType,
        data: {
            labels: labels,
            datasets: [{
                label: 'Transaction Volume (RWF)',
                data: data,
                backgroundColor: currentChartType === 'line' ? 'rgba(0, 63, 90, 0.1)' : colors,
                borderColor: currentChartType === 'line' ? '#003f5a' : colors.map(color => color),
                borderWidth: currentChartType === 'line' ? 3 : 1,
                fill: currentChartType === 'line',
                tension: currentChartType === 'line' ? 0.4 : 0
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false
                },
                ttooltip: {
                    callbacks: {
                        label: function (context) {
                            return `${context.label}: ${formatCurrency(context.parsed)}`;
                        }
                    }
                }

            },
            scales: ['bar', 'line'].includes(currentChartType) ? {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function (value) {
                            return formatCurrencyShort(value);
                        }
                    },
                    title: {
                        display: true,
                        text: 'Transaction Volume (RWF)',
                        font: {
                            size: 12,
                            weight: 'bold'
                        }
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Transaction Types',
                        font: {
                            size: 12,
                            weight: 'bold'
                        }
                    },
                    ticks: {
                        maxRotation: 45,
                        minRotation: 0
                    }
                }
            } : {}
        }
    };

    currentChart = new Chart(ctx, config);
}

function updateSummary() {
    const totalVolume = chartData.reduce((sum, item) => sum + item.total_volume, 0);
    const totalTypes = chartData.length;
    const highestType = chartData.length > 0 ? chartData[0].transaction_type : '-';

    document.getElementById('total-volume').textContent = formatCurrency(totalVolume);
    document.getElementById('total-types').textContent = totalTypes;
    document.getElementById('highest-type').textContent = highestType;
    document.getElementById('chart-summary').style.display = 'flex';
}

function formatCurrency(amount) {
    return new Intl.NumberFormat('en-RW', {
        style: 'currency',
        currency: 'RWF',
        minimumFractionDigits: 0,
        maximumFractionDigits: 0
    }).format(amount);
}

function formatCurrencyShort(amount) {
    if (amount >= 1000000) {
        return (amount / 1000000).toFixed(1) + 'M';
    } else if (amount >= 1000) {
        return (amount / 1000).toFixed(0) + 'K';
    } else {
        return amount.toFixed(0);
    }
}

// Function to manually refresh data (can be called from UI)
function refreshChartData() {
    if (!isChartLoading) {
        loadChartData();
    }
}
