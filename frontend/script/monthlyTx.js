let monthlyChartData = [];
let monthlyCurrentChart = null;
let monthlyIsLoading = false;

// Chart color palette for doughnut segments
const monthlyChartColors = [
  '#003f5a', '#fcca0a', '#e74c3c', '#2ecc71',
  '#9b59b6', '#f39c12', '#1abc9c', '#34495e',
  '#e67e22', '#95a5a6', '#d35400', '#8e44ad'
];

// API config
const MONTHLY_BASE_URL = 'https://momo-data-analysis.onrender.com';
const MONTHLY_API_ENDPOINT = '/api/summary/monthly';

// Automatically trigger data loading when the page finishes loading
document.addEventListener('DOMContentLoaded', function() {
  monthlyPopulateFilterOptions();
  monthlyLoadChartData();
});

/**
 * Populates the year and month select options
 */
function monthlyPopulateFilterOptions() {
  // Populate year options
  const yearSelect = document.getElementById('monthly-year');
  const currentYear = new Date().getFullYear();

//   get availbe transaction years
  for (let year = currentYear; year >= 2024; year--) {
    const option = document.createElement('option');
    option.value = year;
    option.textContent = year;
    yearSelect.appendChild(option);
  }

  // Populate month options
  const monthSelect = document.getElementById('monthly-month');
  const monthNames = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  monthNames.forEach((monthName, index) => {
    const option = document.createElement('option');
    option.value = index + 1; // Month values are 1-12
    option.textContent = monthName;
    monthSelect.appendChild(option);
  });
}

/**
 * Fetches monthly transaction data from the API,
 * handles UI feedback, and renders the doughnut chart.
 */
async function monthlyLoadChartData() {
  if (monthlyIsLoading) return;
  monthlyIsLoading = true;

  // Grab relevant DOM elements
  const loading = document.getElementById('monthly-loading');
  const canvas = document.getElementById('monthlyChartCanvas');
  const refreshBtn = document.getElementById('monthly-filter-btn');
  const statusIndicator = document.getElementById('monthly-status');

  // Show loading spinner and disable refresh button
  loading.style.display = 'flex';
  canvas.style.display = 'none';
  refreshBtn.disabled = true;
  statusIndicator.style.display = 'none';

  try {
    // Get filter values from UI inputs
    const year = document.getElementById('monthly-year').value;
    const month = document.getElementById('monthly-month').value;
    const type = document.getElementById('monthly-type').value;

    // Build query string for API request
    const params = new URLSearchParams();
    if (year) params.append('year', year);
    if (month) params.append('month', month);
    if (type) params.append('transaction_type', type);


    const url = `${MONTHLY_BASE_URL}${MONTHLY_API_ENDPOINT}${params.toString() ? '?' + params : ''}`;

    // Fetch the data from the backend
    const response = await fetch(url, {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      mode: 'cors'
    });

    if (!response.ok) {
      throw new Error(`HTTP error! ${response.status} - ${response.statusText}`);
    }

    const data = await response.json();
    if (data.error) {
      throw new Error(data.error);
    }

    // Transform and sort the data for the chart
    monthlyChartData = data
      .filter(item => item.total_volume != null)
      .map(item => ({
        label: `${String(item.month).padStart(2, '0')}/${item.year}`,
        total_volume: parseFloat(item.total_volume)
      }))
      .sort((a, b) => new Date(`${a.label}/01`) - new Date(`${b.label}/01`));

  } catch (error) {
    console.error('Error loading monthly chart data:', error);

    // Display error feedback
    monthlyChartData = [];
    statusIndicator.className = 'status-indicator status-error';
    statusIndicator.innerHTML = `Failed to load data - Error: ${error.message}`;
    statusIndicator.style.display = 'inline-flex';
  }

  // Reset UI and render chart
  loading.style.display = 'none';
  canvas.style.display = 'block';
  refreshBtn.disabled = false;
  monthlyIsLoading = false;

  monthlyRenderChart();
  monthlyUpdateSummary();
}

/**
 * Renders the doughnut chart using Chart.js
 */
function monthlyRenderChart() {
  const ctx = document.getElementById('monthlyChartCanvas').getContext('2d');

  // Destroy previous chart if it exists to avoid duplication
  if (monthlyCurrentChart) {
    monthlyCurrentChart.destroy();
  }

  // Show a fallback message if there's no data
  if (!monthlyChartData.length) {
    ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
    ctx.font = '16px Arial';
    ctx.fillStyle = '#666';
    ctx.textAlign = 'center';
    ctx.fillText('No monthly transaction data available', ctx.canvas.width / 2, ctx.canvas.height / 2);
    return;
  }

  // Extract labels and values for the chart
  const labels = monthlyChartData.map(item => item.label);
  const data = monthlyChartData.map(item => item.total_volume);
  const colors = monthlyChartData.map((_, i) => monthlyChartColors[i % monthlyChartColors.length]);

  // Chart.js configuration for doughnut
  const config = {
    type: 'doughnut',
    data: {
      labels,
      datasets: [{
        label: 'Monthly Volume (RWF)',
        data,
        backgroundColor: colors
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: { display: true },
        tooltip: {
          callbacks: {
            label: ctx => `${ctx.label}: ${monthlyFormatCurrency(ctx.parsed)}`
          }
        }
      }
    }
  };

  // Create the chart instance
  monthlyCurrentChart = new Chart(ctx, config);
}

/**
 * Updates the summary section below the chart
 */
function monthlyUpdateSummary() {
  const totalVolume = monthlyChartData.reduce((sum, item) => sum + item.total_volume, 0);
  const totalMonths = monthlyChartData.length;
  const highestMonth = totalMonths
    ? monthlyChartData.reduce((a, b) => (a.total_volume > b.total_volume ? a : b)).label
    : '-';

  // Update the UI with computed values
  document.getElementById('monthly-total-volume').textContent = monthlyFormatCurrency(totalVolume);
  document.getElementById('monthly-total-months').textContent = totalMonths;
  document.getElementById('monthly-highest-month').textContent = highestMonth;
  document.getElementById('monthly-chart-summary').style.display = 'flex';
}

/**
 * Formats a number into Rwandan Franc currency format
 * @param {number} amount
 * @returns {string}
 */
function monthlyFormatCurrency(amount) {
  return new Intl.NumberFormat('en-RW', {
    style: 'currency',
    currency: 'RWF',
    minimumFractionDigits: 0,
    maximumFractionDigits: 0
  }).format(amount);
}

/**
 * Converts large numbers to a short format (e.g., 3K, 1.2M)
 * @param {number} amount
 * @returns {string}
 */
function monthlyFormatShort(amount) {
  if (amount >= 1_000_000) return (amount / 1_000_000).toFixed(1) + 'M';
  if (amount >= 1_000) return (amount / 1_000).toFixed(0) + 'K';
  return amount.toFixed(0);
}

/**
 * Manually refresh the chart data (e.g., on button click)
 */
function monthlyRefreshChartData() {
  if (!monthlyIsLoading) {
    monthlyLoadChartData();
  }
}
