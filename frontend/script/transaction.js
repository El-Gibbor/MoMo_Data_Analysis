const API_BASE_URL = 'https://momo-data-analysis.onrender.com';
let currentPage = 1;
let totalPages = 1;
const perPage = 10;
let currentFilters = {};
let isLoading = false;

// Initialize when page loads
document.addEventListener('DOMContentLoaded', function () {
    loadTransactions();
    setupEventListeners();
});

// Load transactions from API
async function loadTransactions() {
    if (isLoading) return;

    isLoading = true;
    showLoading();

    try {
        // Build query parameters
        const params = new URLSearchParams({
            page: currentPage,
            per_page: perPage
        });
