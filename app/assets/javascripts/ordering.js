function outputOrderItems() {
    let order_items_section = document.getElementById("order_items") 
    let url = "api/orders"
    if (order_items_section) {
      let xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let order_items = JSON.parse(this.responseText);
            let output = "";
            let grand_total = 0
            for(let i=0; i < order_items.length; i++) {
                let sub_total = order_items[i].quantity * order_items[i].menu_item.unit_price
                grand_total += sub_total
                output += `<tr>
                             <td>${order_items[i].menu_item.name}</td>
                             <td>${order_items[i].quantity}</td>
                             <td>${order_items[i].menu_item.unit_price}</td>
                             <td>${sub_total}</td>
                          </tr>`
            }
            
            output += `<tr>
                         <td colspan="4"> Total Sum : RM ${grand_total}</td>
                       </tr>`
                       
            order_items_section.innerHTML = output;
        }
      };
     xhttp.open("GET", url, true);
     xhttp.send();
    }
}

document.addEventListener("DOMContentLoaded", function(event) {
    // Your code to run since DOM is loaded and ready
    outputOrderItems()
});

