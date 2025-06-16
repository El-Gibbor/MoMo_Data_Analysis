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

    // Next button
    paginationHTML += `
        <button onclick="changePage(${currentPage + 1})" ${currentPage >= totalPages ? 'disabled' : ''}>
            Next
        </button>
    `;

    paginationDiv.innerHTML = paginationHTML;
}

// Change page function
function changePage(page) {
    if (page < 1 || page > totalPages || page === currentPage) return;
    currentPage = page;
    loadTransactions();
}

// Update summary cards with data
function updateSummaryCards(transactions) {
    if (!transactions) return;

    // Calculate totals (this is just for current page, you might want to get totals from a separate API endpoint)
    const totalTransactions = transactions.length;
    const totalVolume = transactions.reduce((sum, t) => sum + (t.amount || 0), 0);
    const averageAmount = totalVolume / totalTransactions || 0;

    // Count transaction types
    const typeCounts = {};
    transactions.forEach(t => {
        const type = t.transaction_type || 'Unknown';
        typeCounts[type] = (typeCounts[type] || 0) + 1;
    });

    const mostCommonType = Object.keys(typeCounts).reduce((a, b) =>
        typeCounts[a] > typeCounts[b] ? a : b, 'N/A'
    );

    // Update card values
    updateCardValue('.card:nth-child(1) .card-value', totalTransactions.toLocaleString());
    updateCardValue('.card:nth-child(2) .card-value', `${totalVolume.toLocaleString()} RWF`);
    updateCardValue('.card:nth-child(3) .card-value', `${Math.round(averageAmount).toLocaleString()} RWF`);
    updateCardValue('.card:nth-child(4) .card-value', formatTransactionType(mostCommonType));
}

// Helper function to update card values
function updateCardValue(selector, value) {
    const element = document.querySelector(selector);
    if (element) {
        element.textContent = value;
    }
}

function setupEventListeners() {
    // Search functionality
    const searchInput = document.querySelector('.search-filter input[type="text"]');
    if (searchInput) {
        let searchTimeout;
        searchInput.addEventListener('input', function (e) {
            clearTimeout(searchTimeout);
            searchTimeout = setTimeout(() => {
                currentFilters.search = e.target.value.trim() || null;
                currentPage = 1;
                loadTransactions();
            }, 500);
        });
    }

    // Type filter
    const typeFilter = document.querySelector('#type-filter');
    if (typeFilter) {
        typeFilter.addEventListener('change', function (e) {
            const value = e.target.value;
            currentFilters.type = value === 'all' ? null : mapUITypeToAPI(value);
            currentPage = 1;
            loadTransactions();
        });
    }

    // Date filter
    const applyFilterBtn = document.querySelector('.date-filter button');
    if (applyFilterBtn) {
        applyFilterBtn.addEventListener('click', function () {
            const startDate = document.querySelector('#start-date');
            const endDate = document.querySelector('#end-date');

            currentFilters.date_from = startDate.value || null;
            currentFilters.date_to = endDate.value || null;
            currentPage = 1;
            loadTransactions();
        });
    }
}

// Utility functions
function formatDate(dateString) {
    if (!dateString) return 'N/A';
    const date = new Date(dateString);
    return date.toLocaleString('en-GB', {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        hour12: true
    });
}


function formatAmount(amount) {
    if (!amount) return '0';
    return parseInt(amount).toLocaleString();
}

// Colour: transaction status
function getStatusBadge(status) {
    if (!status) return '<span class="status Unknown">Unknown</span>';

    const lowerStatus = status.toLowerCase();
    let statusClass = '';

    if (lowerStatus === 'completed' || lowerStatus === 'successful') {
        statusClass = 'success';
    } else if (lowerStatus === 'pending') {
        statusClass = 'pending';
    } else {
        statusClass = 'Unknown';
    }

    return `<span class="status ${statusClass}">${status}</span>`;
}

function formatTransactionType(type) {
    if (!type) return 'Unknown';

    // Map API types to display names
    const typeMap = {
        'incoming': 'Incoming Money',
        'payment': 'Payment to Merchant',
        'transfer': 'Transfer',
        'withdrawal': 'Withdrawal',
        'deposit': 'Deposit',
        'airtime': 'Airtime Purchase',
        'cash_power': 'Cash Power Payment'
    };

    return typeMap[type.toLowerCase()] || type;
}

function mapUITypeToAPI(uiType) {
    // Map UI filter values to API values
    const typeMap = {
        'incoming': 'incoming',
        'payment': 'payment',
        'transfer': 'transfer',
        'withdrawal': 'withdrawal',
        'deposit': 'deposit'
    };

    return typeMap[uiType] || uiType;
}

function getTransactionDescription(transaction) {
    if (transaction.description) return transaction.description;

    // Generate description based on transaction data
    if (transaction.sender && transaction.receiver) {
        return `From: ${transaction.sender} To: ${transaction.receiver}`;
    } else if (transaction.sender) {
        return `From: ${transaction.sender}`;
    } else if (transaction.receiver) {
        return `To: ${transaction.receiver}`;
    }

    return 'Transaction details';
}

function showLoading() {
    const tbody = document.querySelector('.transactions-table tbody');
    if (tbody) {
        tbody.innerHTML = `
            <tr>
                <td colspan="5" style="text-align: center; padding: 20px;">
                    <i class='bx bx-loader-alt bx-spin'></i> Loading transactions...
                </td>
            </tr>
        `;
    }
}

function hideLoading() {
    // Loading will be hidden when displayTransactions is called
}

function showError(message) {
    const tbody = document.querySelector('.transactions-table tbody');
    if (tbody) {
        tbody.innerHTML = `
            <tr>
                <td colspan="5" style="text-align: center; padding: 20px; color: #e74c3c;">
                    <i class='bx bx-error'></i> ${message}
                </td>
            </tr>
        `;
    }
}

// Modal functionality (detail pop up for each transaction)
function openModal(transactionId, transactionData) {
    const modal = document.getElementById('transactionModal');
    if (!modal) return;

    // Parse transaction data if it's a string
    let transaction;
    try {
        transaction = typeof transactionData === 'string' ? JSON.parse(transactionData) : transactionData;
    } catch (e) {
        console.error('Error parsing transaction data:', e);
        return;
    }

    // Modal content (transaction data)
    const modalContent = modal.querySelector('.transaction-details');
    if (modalContent) {
        modalContent.innerHTML = `
            <h2>Transaction Details</h2>
            <div class="detail-row">
                <div class="detail-label">Transaction ID:</div>
                <div class="detail-value">${transaction.transaction_id || 'N/A'}</div>
            </div>
            <div class="detail-row">
                <div class="detail-label">External ID:</div>
                <div class="detail-value">${transaction.external_transaction_id || 'N/A'}</div>
            </div>
            <div class="detail-row">
                <div class="detail-label">Date & Time:</div>
                <div class="detail-value">${formatDate(transaction.date_and_time)}</div>
            </div>
            <div class="detail-row">
                <div class="detail-label">Transaction Type:</div>
                <div class="detail-value">${formatTransactionType(transaction.transaction_type)}</div>
            </div>
            <div class="detail-row">
                <div class="detail-label">Amount:</div>
                <div class="detail-value">${formatAmount(transaction.amount)} RWF</div>
            </div>
            <div class="detail-row">
                <div class="detail-label">Transaction Fee:</div>
                <div class="detail-value">${formatAmount(transaction.transaction_fee)} RWF</div>
            </div>
            <div class="detail-row">
                <div class="detail-label">New Balance:</div>
                <div class="detail-value">${formatAmount(transaction.new_balance)} RWF</div>
            </div>
            <div class="detail-row">
                <div class="detail-label">Sender:</div>
                <div class="detail-value">${transaction.sender || 'N/A'}</div>
            </div>
            <div class="detail-row">
                <div class="detail-label">Receiver:</div>
                <div class="detail-value">${transaction.receiver || 'N/A'}</div>
            </div>
            <div class="detail-row">
                <div class="detail-label">Status:</div>
                <div class="detail-value">${transaction.status || 'N/A'}</div>
            </div>
            <div class="detail-row">
                <div class="detail-label">Description:</div>
                <div class="detail-value">${transaction.description || 'N/A'}</div>
            </div>
            <div class="detail-row">
                <div class="detail-label">Institution/Vendor:</div>
                <div class="detail-value">${transaction.institution_vendor || 'N/A'}</div>
            </div>
            <div class="detail-row">
                <div class="detail-label">Transaction Method:</div>
                <div class="detail-value">${transaction.transaction_method || 'N/A'}</div>
            </div>
        `;
    }