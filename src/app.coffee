
leaf = require('./partials/leaf.jade')
console.log 'leaf', leaf()

content = document.getElementById("content")
content.innerHTML = leaf()
