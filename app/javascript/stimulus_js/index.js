import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import Flatpickr from "stimulus-flatpickr";

const application = Application.start();
const context = require.context("./controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

// Manually register Flatpickr as a stimulus controller
application.register("flatpickr", Flatpickr);
