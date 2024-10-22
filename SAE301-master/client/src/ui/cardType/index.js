import { genericRenderer } from "../../lib/utils.js";

const templateFile = await fetch("src/ui/cardType/templateCardType.html.inc");
const template = await templateFile.text();

let TypeCardView = {
  render: function (data) {
    let html = "";
    for (let obj of data) {
      html += genericRenderer(template, obj);
    }
    return html;
  },
};

export { TypeCardView };