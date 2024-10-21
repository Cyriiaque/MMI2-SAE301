


/**
 * Renders a template string by replacing placeholders with corresponding data values.
 *
 * @param {string} template - The template string containing placeholders in the format {{key}}.
 * @param {Object} data - An object containing key-value pairs where the key corresponds to the placeholder in the template.
 * @returns {string} - The rendered HTML string with placeholders replaced by data values.
 */
let genericRenderer = function(template, data, prefix=""){
    let html = template;
    for(let key in data){
        if(typeof data[key] === "object"){
            html = genericRenderer(html, data[key], prefix+key+".");
        }
        
        let tag = "{{"+prefix+key+"}}";
        html = html.replaceAll(new RegExp(tag, "g"), data[key]);
    }
    return html;
}
export { genericRenderer };