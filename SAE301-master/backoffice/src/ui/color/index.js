import { genericRenderer } from "../../lib/utils.js";

const templateFile = await fetch("src/ui/color/templatecolor.html.inc");
const template = await templateFile.text();

let ColorView = {
  render: function (data) {
    let html = "";
    for (let obj of data) {
      html += genericRenderer(template, obj);
    }
    return html;
  },
};

export { ColorView };