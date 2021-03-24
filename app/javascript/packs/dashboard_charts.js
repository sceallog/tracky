const ctx_1 = document.getElementById('ticketsStatusChart');
const statusChart = new Chart(ctx_1, {
  type: 'bar',
  data: {
    labels: JSON.parse(ctx_1.dataset.labels.toString()), 
    datasets: [{
      data: JSON.parse(ctx_1.dataset.tickets),
      backgroundColor: [
        'rgba(231, 74, 59, 0.8)',
        'rgba(78, 115, 223, 0.8)',
        'rgba(28, 200, 138, 0.8)',
        'rgba(253, 126, 20, 0.8)'
      ],
      borderWidth: 1
    }]
    },
    options: {
        legend: {
            display: false
          },
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    stepSize: 1
                  }
              }]
          }
      }
});


const ctx_2 = document.getElementById('ticketsPriorityChart');
const priorityChart = new Chart(ctx_2, {
  type: 'bar',
  data: {
    labels: JSON.parse(ctx_2.dataset.labels), 
    datasets: [{
      data: JSON.parse(ctx_2.dataset.tickets),
      backgroundColor: [
        'rgba(133, 135, 150, 0.8)',
        'rgba(255, 206, 86, 0.8)',
        'rgba(253, 126, 20, 0.8)',
        'rgba(231, 74, 59, 0.8)'
      ],
      borderWidth: 1
    }]
  },
    options: {
        legend: {
            display: false
          },
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    stepSize: 1
                  }
              }]
          }
      }
});

const ctx_3 = document.getElementById('ticketsTypeChart');
const typeChart = new Chart(ctx_3, {
  type: 'pie',
  data: {
    labels: JSON.parse(ctx_3.dataset.labels), 
    datasets: [{
      data: JSON.parse(ctx_3.dataset.tickets),
      backgroundColor: [
        'rgba(231, 74, 59, 0.8)',
        'rgba(32, 201, 166, 0.8)',
        'rgba(54, 185, 204, 0.8)'
      ],
      borderWidth: 1
    }]
  },
    options: {
        legend: {
            position: 'right'
          }
      }
});
