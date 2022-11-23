import {physics} from "./collisionUtils.js"

// HANDLE CANVAS

const canvas = document.getElementById("mainCanvas")
let docWidth = window.innerHeight;
let docHeight = window.innerWidth;
console.log(docWidth)
console.log(docHeight)
canvas.setAttribute("width", docWidth)
canvas.setAttribute("height", docHeight)

// HANDLE BALLS
let r1 = 75
let r2 = 75
let inix1 = 150
let inix2 = 350
let iniy1 = 80
let iniy2 = 380
const ball1 = document.getElementById("particle1")
const ball2 = document.getElementById("particle2")
// initializing the positions
ball1.setAttribute("cx", inix1.toString())
ball2.setAttribute("cx", inix2.toString())
ball1.setAttribute("cy", iniy1.toString())
ball2.setAttribute("cy", iniy2.toString())
ball1.setAttribute("r", r1.toString())
ball2.setAttribute("r", r2.toString())

// make them jiggle around
const rates = {
    "ball1":[5.2, -2.4],
    "ball2":[-2.2, 5.4]
}
let framerate = 50


const physics = (x1Rate, framerate) => {
    let currentX1 = ball1.getAttribute("cx")
    let newX1 = parseInt(currentX1) + x1Rate
    ball1.setAttribute("cx", newX1.toString())
    setTimeout(floatAround, framerate)
  }

const Euclidean = (x1, y1, x2, y2) => {
    let dx = x1 - x2 
    let dy = y1 - y2 
    return Math.sqrt(dx*dx + dy*dy)
}


const movement = () => {
    // are the touching each other
    let currentX1 = parseInt(ball1.getAttribute("cx"))
    let currentX2 = parseInt(ball2.getAttribute("cx"))
    let currentY1 = parseInt(ball1.getAttribute("cy"))
    let currentY2 = parseInt(ball2.getAttribute("cy"))
    let contactCondition = Euclidean(currentX1, currentY1, currentX2, currentY2) <= r1 + r2
    if (contactCondition) {
        
    }
}



physics(x1Rate, framerate)