function outputMenuItems(category_id) {
    let menu_items_section = document.getElementById("menu_items") 
    
    if (menu_items_section) {
      let url = "api/menu_items"
      if (category_id) {
        url = `api/menu_items?category_id=${category_id}`
      }
      
      let xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          let menu_items = JSON.parse(this.responseText);
          let output = "";
          for(let i=0; i < menu_items.length; i++) {
            output += `<tr>
                           <td>${menu_items[i].name}</td>
                           <td>${menu_items[i].unit_price}</td>
                           <td><input type="text" data-menu_item_id="${menu_items[i].id}" /></td>
                           <td><button class="addToCartButton">Add to cart</button></td>
                        </tr>`
          }
          menu_items_section.innerHTML = output;
          addEventToButtons()
        }
      };
      xhttp.open("GET", url, true);
      xhttp.send();
    }
}

function addToCart(ele) {
    console.log( "trigger add to cart" )
    let data = new FormData();
    let target = ele.parentElement.previousElementSibling.firstElementChild
    let quantity = target.value
    let menu_item_id = target.getAttribute("data-menu_item_id")
    if (quantity) {
      data.append('quantity', quantity);
      data.append('menu_item_id', menu_item_id);
      let xhr = new XMLHttpRequest();
      xhr.open('POST', 'api/menu_items', true);
      
      // https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
      xhr.onload = function () {
        let result = JSON.parse(this.responseText);
          
        if (this.status == 200) {
          // console.log(JSON.parse(this.responseText))
          
          let node = document.createElement("P");     
          node.classList = ["notice_message"]
          let textnode = document.createTextNode(`You have just order ${quantity} ${result.menu_item.name}`); 
          node.appendChild(textnode);
          document.getElementById("flash_messages").appendChild(node); 
          // window.scrollTo(0, 0);
          setTimeout(function(){
            document.getElementById("flash_messages").removeChild(node)
          }, 3000)
          target.value = ""
          outputOrderItems();
        } else if (this.status == 401 ) {
          let node = document.createElement("P");     
          node.classList = ["alert_message"]
          let textnode = document.createTextNode(result.message); 
          node.appendChild(textnode);
          document.getElementById("flash_messages").appendChild(node); 
          // window.scrollTo(0, 0);
          setTimeout(function(){
            document.getElementById("flash_messages").removeChild(node)
          }, 3000)
          
        } else if (this.status == 422 ) {
          let node = document.createElement("P");     
          node.classList = ["alert_message"]
          let textnode = document.createTextNode(result.message); 
          node.appendChild(textnode);
          document.getElementById("flash_messages").appendChild(node); 
          // window.scrollTo(0, 0);
          setTimeout(function(){
            document.getElementById("flash_messages").removeChild(node)
          }, 3000)
          
        } else if (this.status == 404 ) {
          let node = document.createElement("P");     
          node.classList = ["alert_message"]
          let textnode = document.createTextNode("Menu item not exist in the system"); 
          node.appendChild(textnode);
          document.getElementById("flash_messages").appendChild(node); 
          // window.scrollTo(0, 0);
          setTimeout(function(){
            document.getElementById("flash_messages").removeChild(node)
          }, 3000)
          
        }
          
      };
      xhr.send(data);
       
    }
}

function addEventToButtons() {
  let buttons = document.getElementsByClassName("addToCartButton")
  for(let i=0; i < buttons.length; i++) {
      buttons[i].addEventListener("click", function() {
          addToCart(buttons[i]);
      });
  }
}

function addEventToCategories() {
  let links = document.getElementsByClassName("filteringByCategory")
  for(let i=0; i < links.length; i++) {
      links[i].addEventListener("click", function() {
          filterMenuItemsByCategory(links[i]);
      });
  }
}

function filterMenuItemsByCategory(ele) {
    let category_id = ele.getAttribute("data-category-id")
    outputMenuItems(category_id)
}

document.addEventListener("DOMContentLoaded", function(event) {
    // Your code to run since DOM is loaded and ready
    outputMenuItems();
    addEventToCategories();
});

