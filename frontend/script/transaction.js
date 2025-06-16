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

        // Add filters if they exist
        if (currentFilters.search) params.append('search', currentFilters.search);
        if (currentFilters.type) params.append('type', currentFilters.type);
        if (currentFilters.status) params.append('status', currentFilters.status);
        if (currentFilters.date_from) params.append('date_from', currentFilters.date_from);
        if (currentFilters.date_to) params.append('date_to', currentFilters.date_to);
        // if (currentFilters.min_amount) params.append('min_amount', currentFilters.min_amount);
        // if (currentFilters.max_amount) params.append('max_amount', currentFilters.max_amount);

        const response = await fetch(`${API_BASE_URL}/api/transactions?${params}`);

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const data = await response.json();

        displayTransactions(data.transactions);
        updatePagination(data.pagination);
        updateSummaryCards(data.transactions);

    } catch (error) {
        console.error('Error loading transactions:', error);
        showError('Failed to load transactions. Please try again.');
    } finally {
        isLoading = false;
        hideLoading();
    }
}
