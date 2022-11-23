
const physics = (x1Rate, delay) => {
    let currentX1 = ball1.getAttribute("cx")
    let newX1 = parseInt(currentX1) + x1Rate
    ball1.setAttribute("cx", newX1.toString())
    setTimeout(floatAround, delay)
  }

export {
    physics
}