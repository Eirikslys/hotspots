import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


flatpickr(".datepicker", {

  enableTime: true,
  // altInput: true,
  dateFormat: "Y-m-d H:i",
  plugins: [new rangePlugin({ input: "#rental_end_date"})]
});
