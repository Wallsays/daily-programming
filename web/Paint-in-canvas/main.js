function Paint(canvas) {
    var drawing = false;
    var erasing = false;
    var self = this;
    var ctx = canvas.getContext("2d");
    var overlay = canvas.cloneNode();

    var form = document.createElement('form');

    var backgroundColor = "#f5f5f5";

    var painter = {
        radius: 3,
        color: "#333"
    }

    var eraser = {
        width: 10,
        height: 10,
        color: backgroundColor
    };

    this.x;
    this.y;

    function cancel(e) {
        e.preventDefault();
        return false;
    }

    function drawCircle(x, y, painter) {
        ctx.fillStyle = painter.color;
        ctx.beginPath();
        ctx.arc(x, y, painter.radius, 0, Math.PI * 2);
        ctx.fill();
    }

    function drawRect(x, y, painter) {
        ctx.fillStyle = painter.color;
        ctx.fillRect(x, y, painter.width, painter.height);
    }
    
    function draw(e, onePoint) {
        var x;
        var y;

        if (e.pageX || e.pageY) {
            x = e.pageX;
            y = e.pageY;
        }
        else {
            x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
            y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
        }
        
        x -= canvas.offsetLeft;
        y -= canvas.offsetTop;


        overlay.ctx.clearRect(0, 0, overlay.width, overlay.height);

        if (drawing) {
	    ctx.strokeStyle = painter.color;
            ctx.lineWidth = painter.radius;
            ctx.lineCap = "round";

	    if (self.x == undefined) {
		self.x = x;
		self.y = y;
	    }

	    ctx.beginPath();
	    ctx.moveTo(self.x, self.y);
	    ctx.lineTo(x, y);
	    ctx.stroke();

	    self.x = x;
	    self.y = y;


        } else if (erasing) {
            x -= eraser.width / 2;
            y -= eraser.height / 2,

            overlay.ctx.strokeRect(x, y, eraser.width, eraser.height);
            
            drawRect(x, y, eraser);
        }
    }

    this.upListener = function(e) {
        drawing = false;
        erasing = false;
        
        self.x = self.y = undefined;
	
        overlay.ctx.clearRect(0, 0, overlay.width, overlay.height);
    }

    this.downListener = function(e) {
        switch(e.button) {
        case 0:
            painter.color = form.painterColor.value;
            painter.radius = form.painterRadius.value;
            drawing = true;
            break;
        case 2:
            eraser.color = form.eraserColor.value;
            eraser.width = form.eraserWidth.value;
            eraser.height = form.eraserHeight.value;
            erasing = true;
            break;
        }
        
        draw(e);

        return false;
    }

    this.moveListener = function(e) {
        if (drawing || erasing)
            draw(e);
    }

    form.addInput = function(name, value, label) {
        var labelKey = name + "Label";
        form[labelKey] = document.createElement('label');
        form[labelKey].textContent = label;
        form[labelKey].style.color = backgroundColor;
        form[labelKey].style.display = "block";
        
        form[name] = document.createElement('input');
        form[name].value = value;
        form[name].style.position = "absolute";
        form[name].style.left = "8em";
        
        
        form[labelKey].appendChild(form[name]);
        form.appendChild(form[labelKey]);
    }

    function onResize() {
        overlay.style.top = canvas.offsetTop;
        overlay.style.left = canvas.offsetLeft;

        form.style.top = canvas.offsetTop;
        form.style.left = canvas.offsetLeft + canvas.width + 10;
    }

    /* ========================== */
    canvas.style.backgroundColor = backgroundColor;
    canvas.style.margin = "auto";
    canvas.style.display = "block";
    canvas.style.cursor = "default";

    /* ========================== */
    canvas.addEventListener("mousedown", this.downListener);
    document.addEventListener("mouseup", this.upListener);
    canvas.addEventListener("mousemove", this.moveListener);
    canvas.addEventListener("contextmenu", cancel);
    document.addEventListener("selectstart", cancel);
    window.addEventListener("resize", onResize);

    /* ========================== */
    overlay.style.backgroundColor = "transparent";
    overlay.style.position = "absolute";
    overlay.style.pointerEvents = "none";
    overlay.ctx = overlay.getContext("2d");


    /* ========================== */
    form.style.position = "absolute";

    form.addInput("painterColor", painter.color, "Painter color");
    form.addInput("painterRadius", painter.radius, "Painter radius");

    form.addInput("eraserColor", eraser.color, "Eraser color");
    form.addInput("eraserWidth", eraser.width, "Eraser width");
    form.addInput("eraserHeight", eraser.height, "Eraser height");

    /* ========================== */
    onResize();
    document.body.appendChild(overlay);
    document.body.appendChild(form);
}

document.body.style.backgroundColor = "#333";

new Paint(document.getElementById("canvas"));