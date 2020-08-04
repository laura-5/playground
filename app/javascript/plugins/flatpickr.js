import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

 const reservationForm = document.getElementById('reservation-form-div');

 if (reservationForm) {
  const reservations = JSON.parse(reservationForm.dataset.reservations);
  flatpickr("#range_start", {
    plugins: [new rangePlugin({ input: "#range_end"})],
    minDate: "today",
    inline: true,
    altInput: true,
    altFormat: "F j, Y",
    enableTime: true,
    dateFormat: "d-m-Y h:i",
    "disable": reservations,
  })
}

 const activiteForm = document.getElementById('activite-form-div');

 if (activiteForm) {
  const activites = JSON.parse(activiteForm.dataset.activites);
  flatpickr("#range_start", {
    plugins: [new rangePlugin({ input: "#range_end"})],
    minDate: "today",
    inline: true,
    dateFormat: "Y-m-d",
    "disable": activites,
  })
}
