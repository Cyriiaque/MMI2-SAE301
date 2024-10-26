import { genericRenderer } from "../../lib/utils.js";

const templateFile = await fetch("src/ui/size/templatesize.html.inc");
const template = await templateFile.text();

let SizeView = {
  render: function (data) {
    let html = "";
    for (let obj of data) {
      html += genericRenderer(template, { size: obj });
    }
    return html;
  },
};

export { SizeView };