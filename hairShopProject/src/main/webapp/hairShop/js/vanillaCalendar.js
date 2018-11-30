var vanillaCalendar = {
    month: document.querySelectorAll('[data-calendar-area="month"]')[0],
    next: document.querySelectorAll('[data-calendar-toggle="next"]')[0],
    previous: document.querySelectorAll('[data-calendar-toggle="previous"]')[0],
    label: document.querySelectorAll('[data-calendar-label="month"]')[0],
    activeDates: null,
    date: new Date,
    todaysDate: new Date,
    init: function(t) {
        this.options = t, this.date.setDate(1), this.createMonth(), this.createListeners()
    },
    createListeners: function() {
        var t = this;
        this.next.addEventListener("click", function() {
            t.clearCalendar();
            var e = t.date.getMonth() + 1;
            t.date.setMonth(e), t.createMonth()
        }), this.previous.addEventListener("click", function() {
            t.clearCalendar();
            var e = t.date.getMonth() - 1;
            t.date.setMonth(e), t.createMonth()
        })
    },
    createDay: function(t, e, a) {
        var n = document.createElement("div"),
            s = document.createElement("span");
        s.innerHTML = t,
        n.className = "vcal-date",
        n.setAttribute("data-calendar-date", this.date),
        1 === t && (n.style.marginLeft = 0 === e ? 6 * 14.28 + "%" : 14.28 * (e - 1) + "%"),
        this.options.disablePastDays && this.date.getTime() <= this.todaysDate.getTime() - 1 ? (n.classList.add("vcal-date--disabled"),
        		n.setAttribute("data-calendar-status", "disable")) : (n.classList.add("vcal-date--active"), n.setAttribute("data-calendar-status", "active")),
        		this.date.getTime() > this.todaysDate.getTime() + 1209600000-1 ? (n.classList.add("vcal-date--disabled"), n.classList.remove("vcal-date--active"),
        														// 14 * 86400 * 1000   2주 * 하루 초 * milli seconds
         				n.setAttribute("data-calendar-status", "disable")): n.classList.add("vcal-date--active"),
        				this.date.toString() === this.todaysDate.toString() && n.classList.add("vcal-date--today"),
        				n.appendChild(s), this.month.appendChild(n)
    },
    dateClicked: function() {
        var t = this;
        this.activeDates = document.querySelectorAll('[data-calendar-status="active"]');
        for (var e = 0; e < this.activeDates.length; e++) this.activeDates[e].addEventListener("click", function(e) {
           var selectedDay = this.dataset.calendarDate;
           selectedMon = selectedDay.substring(4, 7);
           if(selectedMon === 'Jan') selectedMon='1';
           else if(selectedMon === 'Feb') selectedMon='2';
           else if(selectedMon === 'Mar') selectedMon='3';
           else if(selectedMon === 'Apr') selectedMon='4';
           else if(selectedMon === 'May') selectedMon='5';
           else if(selectedMon === 'Jun') selectedMon='6';
           else if(selectedMon === 'Jul') selectedMon='7';
           else if(selectedMon === 'Aug') selectedMon='8';
           else if(selectedMon === 'Sep') selectedMon='9';
           else if(selectedMon === 'Oct') selectedMon='10';
           else if(selectedMon === 'Nov') selectedMon='11';
           else if(selectedMon === 'Dec') selectedMon='12';
           selectedDate = selectedDay.substring(8, 15);
           document.querySelectorAll('[data-calendar-label="picked"]')[0].innerHTML = "", t.removeActiveClass(), this.classList.add("vcal-date--selected")
           document.getElementById("selectedDay").value = selectedMon+" "+selectedDate;
        })
    },
    createMonth: function() {
        for (var t = this.date.getMonth(); this.date.getMonth() === t;) this.createDay(this.date.getDate(), this.date.getDay(), this.date.getFullYear()), this.date.setDate(this.date.getDate() + 1);
        this.date.setDate(1), this.date.setMonth(this.date.getMonth() - 1), this.label.innerHTML = this.date.getFullYear() + "년  " + this.monthsAsString(this.date.getMonth()), this.dateClicked()
    },
    monthsAsString: function(t) {
        return ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"][t]
    },
    clearCalendar: function() {
        vanillaCalendar.month.innerHTML = ""
    },
    removeActiveClass: function() {
        for (var t = 0; t < this.activeDates.length; t++) this.activeDates[t].classList.remove("vcal-date--selected")
    }
};
