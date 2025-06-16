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

// Display transactions in the table
function displayTransactions(transactions) {
    const tbody = document.querySelector('.transactions-table tbody');
    if (!tbody) return;

    if (!transactions || transactions.length === 0) {
        tbody.innerHTML = `
            <tr>
                <td colspan="5" style="text-align: center; padding: 20px; color: #666;">
                    No transactions found
                </td>
            </tr>
        `;
        return;
    }

    tbody.innerHTML = transactions.map(transaction => {
        const date = formatDate(transaction.date_and_time);
        const amount = formatAmount(transaction.amount);
        const status = getStatusBadge(transaction.status);
        const type = formatTransactionType(transaction.transaction_type);
        const description = getTransactionDescription(transaction);

        return `
            <tr onclick="openModal('${transaction.transaction_id}', ${JSON.stringify(transaction).replace(/"/g, '&quot;')})">
                <td>${date}</td>
                <td>${type}</td>
                <td>${amount}</td>
                <td>${description}</td>
                <td>${status}</td>
            </tr>
        `;
    }).join('');
}

// Update pagination buttons
function updatePagination(pagination) {
    currentPage = pagination.page;
    totalPages = pagination.pages;

    const paginationDiv = document.querySelector('.pagination');
    if (!paginationDiv) return;

    let paginationHTML = '';

    // Previous button
    paginationHTML += `
        <button onclick="changePage(${currentPage - 1})" ${currentPage <= 1 ? 'disabled' : ''}>
            Prev
        </button>
    `;

    // Page numbers (show current page and 2 pages around it)
    const startPage = Math.max(1, currentPage - 2);
    const endPage = Math.min(totalPages, currentPage + 2);

    if (startPage > 1) {
        paginationHTML += `<button onclick="changePage(1)">1</button>`;
        if (startPage > 2) {
            paginationHTML += `<span>...</span>`;
        }
    }

    for (let i = startPage; i <= endPage; i++) {
        paginationHTML += `
            <button onclick="changePage(${i})" ${i === currentPage ? 'class="active"' : ''}>
                ${i}
            </button>
        `;
    }

    if (endPage < totalPages) {
        if (endPage < totalPages - 1) {
            paginationHTML += `<span>...</span>`;
        }
        paginationHTML += `<button onclick="changePage(${totalPages})">${totalPages}</button>`;
    }
