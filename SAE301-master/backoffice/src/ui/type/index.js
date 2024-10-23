import { genericRenderer } from "../../lib/utils.js";

const templateFile = await fetch("src/ui/type/templatetype.html.inc");
const template = await templateFile.text();

let TypeView = {
  render: function (data) {
    let html = "";
    for (let obj of data) {
      html += genericRenderer(template, obj);
    }
    return html;
  },
};

export { TypeView };