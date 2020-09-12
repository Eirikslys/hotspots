import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const toggleDateInputs = function() {
  const startDateInput = document.getElementById('rental_start_date');
  const endDateInput = document.getElementById('rental_end_date');

  if (startDateInput && endDateInput) {
    const unvailableDates = JSON.parse(document.querySelector('.widget-content').dataset.unavailable)

    flatpickr(startDateInput, {
    minDate: 'today',
    dateFormat: 'd-m-Y',
    disable: unvailableDates,
    plugins: [new rangePlugin({ input: "#rental_end_date"})],
    onChange: function(selectedDates, selectedDate) {
      if (selectedDate === '') {
        endDateInput.disabled = true;
      }
      let minDate = selectedDates[0];
      minDate.setDate(minDate.getDate() + 1);
      endDateCalendar.set('minDate', minDate);
      endDateInput.disabled = false;
    }
  });
    const endDateCalendar =
      flatpickr(endDateInput, {
        dateFormat: 'd-m-Y',
        disable: unvailableDates,
        plugins: [new rangePlugin({ input: "#rental_end_date"})]
        },
       );
  }
};

export { toggleDateInputs }

// const flatpickerfunc = () => {flatpickr(".datepicker", {
//   enableTime: true,
//   altInput: true,
//   dateFormat: "Y-m-d H:i",
//   plugins: [new rangePlugin({ input: "#rental_end_date"})]
// });
// }

// export { flatpickerfunc };
