const ctx_1 = document.getElementById('ticketsStatusChart');
const statusChart = new Chart(ctx_1, {
  type: 'bar',
  data: {
    labels: JSON.parse(ctx_1.dataset.labels.toString()), 
    datasets: [{
      data: JSON.parse(ctx_1.dataset.tickets),
      backgroundColor: [
        'rgba(255, 99, 132, 0.5)',
        'rgba(255, 206, 86, 0.5)',
        'rgba(30, 192, 92, 0.5)',
        'rgba(0, 50, 192, 0.5)'
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
        'rgba(255, 99, 132, 0.5)',
        'rgba(255, 206, 86, 0.5)',
        'rgba(30, 192, 92, 0.5)',
        'rgba(0, 50, 192, 0.5)'
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
        'rgba(255, 99, 132, 0.5)',
        'rgba(255, 206, 86, 0.5)',
        'rgba(30, 192, 92, 0.5)'
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
