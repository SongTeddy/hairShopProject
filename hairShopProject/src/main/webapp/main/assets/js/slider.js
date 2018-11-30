! function(g, i, m, f, d, k, e) {
    new(function() {});
    var c = {
            C: m.PI,
            H: m.max,
            v: m.min,
            qb: m.ceil,
            X: m.floor,
            rb: m.abs,
            sb: m.sin,
            gc: m.cos,
            jd: m.tan,
            Te: m.atan,
            nc: m.sqrt,
            p: m.pow,
            D: m.round
        },
        h = {
            Re: function(a) {
                return -c.gc(a * c.C) / 2 + .5
            },
            Ub: function(a) {
                return a
            },
            Qe: function(a) {
                return a * a
            },
            Vd: function(a) {
                return -a * (a - 2)
            },
            lf: function(a) {
                return (a *= 2) < 1 ? 1 / 2 * a * a : -1 / 2 * (--a * (a - 2) - 1)
            },
            of: function(a) {
                return a * a * a
            },
            Jf: function(a) {
                return (a -= 1) * a * a + 1
            },
            If: function(a) {
                return (a *= 2) < 1 ? 1 / 2 * a * a * a : 1 / 2 * ((a -= 2) * a * a + 2)
            },
            Hf: function(a) {
                return a * a * a * a
            },
            Gf: function(a) {
                return -((a -= 1) * a * a * a - 1)
            },
            Ff: function(a) {
                return (a *= 2) < 1 ? 1 / 2 * a * a * a * a : -1 / 2 * ((a -= 2) * a * a * a - 2)
            },
            zf: function(a) {
                return a * a * a * a * a
            },
            Pd: function(a) {
                return (a -= 1) * a * a * a * a + 1
            },
            ng: function(a) {
                return (a *= 2) < 1 ? 1 / 2 * a * a * a * a * a : 1 / 2 * ((a -= 2) * a * a * a * a + 2)
            },
            jf: function(a) {
                return 1 - c.gc(c.C / 2 * a)
            },
            pf: function(a) {
                return c.sb(c.C / 2 * a)
            },
            qf: function(a) {
                return -1 / 2 * (c.gc(c.C * a) - 1)
            },
            rf: function(a) {
                return a == 0 ? 0 : c.p(2, 10 * (a - 1))
            },
            sf: function(a) {
                return a == 1 ? 1 : -c.p(2, -10 * a) + 1
            },
            tf: function(a) {
                return a == 0 || a == 1 ? a : (a *= 2) < 1 ? 1 / 2 * c.p(2, 10 * (a - 1)) : 1 / 2 * (-c.p(2, -10 * --a) + 2)
            },
            uf: function(a) {
                return -(c.nc(1 - a * a) - 1)
            },
            vf: function(a) {
                return c.nc(1 - (a -= 1) * a)
            },
            wf: function(a) {
                return (a *= 2) < 1 ? -1 / 2 * (c.nc(1 - a * a) - 1) : 1 / 2 * (c.nc(1 - (a -= 2) * a) + 1)
            },
            xf: function(a) {
                if (!a || a == 1) return a;
                var b = .3,
                    d = .075;
                return -(c.p(2, 10 * (a -= 1)) * c.sb((a - d) * 2 * c.C / b))
            },
            yf: function(a) {
                if (!a || a == 1) return a;
                var b = .3,
                    d = .075;
                return c.p(2, -10 * a) * c.sb((a - d) * 2 * c.C / b) + 1
            },
            Af: function(a) {
                if (!a || a == 1) return a;
                var b = .45,
                    d = .1125;
                return (a *= 2) < 1 ? -.5 * c.p(2, 10 * (a -= 1)) * c.sb((a - d) * 2 * c.C / b) : c.p(2, -10 * (a -= 1)) * c.sb((a - d) * 2 * c.C / b) * .5 + 1
            },
            Bf: function(a) {
                var b = 1.70158;
                return a * a * ((b + 1) * a - b)
            },
            Cf: function(a) {
                var b = 1.70158;
                return (a -= 1) * a * ((b + 1) * a + b) + 1
            },
            Df: function(a) {
                var b = 1.70158;
                return (a *= 2) < 1 ? 1 / 2 * a * a * (((b *= 1.525) + 1) * a - b) : 1 / 2 * ((a -= 2) * a * (((b *= 1.525) + 1) * a + b) + 2)
            },
            qd: function(a) {
                return 1 - h.fd(1 - a)
            },
            fd: function(a) {
                return a < 1 / 2.75 ? 7.5625 * a * a : a < 2 / 2.75 ? 7.5625 * (a -= 1.5 / 2.75) * a + .75 : a < 2.5 / 2.75 ? 7.5625 * (a -= 2.25 / 2.75) * a + .9375 : 7.5625 * (a -= 2.625 / 2.75) * a + .984375
            },
            Ef: function(a) {
                return a < 1 / 2 ? h.qd(a * 2) * .5 : h.fd(a * 2 - 1) * .5 + .5
            },
            Kf: c.qb,
            nf: c.X
        };
    var b = new function() {
        var j = this,
            vb = /\S+/g,
            G = 1,
            pb = 2,
            sb = 3,
            rb = 4,
            Z = 5,
            H, r = 0,
            n = 0,
            B = 0,
            A = navigator,
            fb = A.appName,
            p = A.userAgent,
            q = parseFloat;

        function Eb() {
            if (!H) {
                H = {
                    Tc: "ontouchstart" in g || "createTouch" in i
                };
                var a;
                if (A.pointerEnabled || (a = A.msPointerEnabled)) H.je = a ? "msTouchAction" : "touchAction"
            }
            return H
        }

        function u(h) {
            if (!r) {
                r = -1;
                if (fb == "Microsoft Internet Explorer" && !!g.attachEvent && !!g.ActiveXObject) {
                    var e = p.indexOf("MSIE");
                    r = G;
                    n = q(p.substring(e + 5, p.indexOf(";", e))); /* @cc_on@ */
                } else if (fb == "Netscape" && !!g.addEventListener) {
                    var d = p.indexOf("Firefox"),
                        b = p.indexOf("Safari"),
                        f = p.indexOf("Chrome"),
                        c = p.indexOf("AppleWebKit");
                    if (d >= 0) {
                        r = pb;
                        n = q(p.substring(d + 8))
                    } else if (b >= 0) {
                        var i = p.substring(0, b).lastIndexOf("/");
                        r = f >= 0 ? rb : sb;
                        n = q(p.substring(i + 1, b))
                    } else {
                        var a = /Trident\/.*rv:([0-9]{1,}[\.0-9]{0,})/i.exec(p);
                        if (a) {
                            r = G;
                            n = q(a[1])
                        }
                    }
                    if (c >= 0) B = q(p.substring(c + 12))
                } else {
                    var a = /(opera)(?:.*version|)[ \/]([\w.]+)/i.exec(p);
                    if (a) {
                        r = Z;
                        n = q(a[2])
                    }
                }
            }
            return h == r
        }

        function v() {
            return u(G)
        }

        function qb() {
            return u(sb)
        }

        function ub() {
            return u(Z)
        }

        function mb() {
            return qb() && B > 534 && B < 535
        }

        function I() {
            u();
            return B > 537 || n > 42 || r == G && n >= 11
        }

        function nb(a) {
            var b, c;
            return function(g) {
                if (!b) {
                    b = d;
                    var f = a.substr(0, 1).toUpperCase() + a.substr(1);
                    l([a].concat(["WebKit", "ms", "Moz", "O", "webkit"]), function(h, d) {
                        var b = a;
                        if (d) b = h + f;
                        if (g.style[b] != e) return c = b
                    })
                }
                return c
            }
        }

        function lb(b) {
            var a;
            return function(c) {
                a = a || nb(b)(c) || b;
                return a
            }
        }
        var L = lb("transform");

        function eb(a) {
            return {}.toString.call(a)
        }
        var bb = {};
        l(["Boolean", "Number", "String", "Function", "Array", "Date", "RegExp", "Object"], function(a) {
            bb["[object " + a + "]"] = a.toLowerCase()
        });

        function l(b, d) {
            var a, c;
            if (eb(b) == "[object Array]") {
                for (a = 0; a < b.length; a++)
                    if (c = d(b[a], a, b)) return c
            } else
                for (a in b)
                    if (c = d(b[a], a, b)) return c
        }

        function F(a) {
            return a == f ? String(a) : bb[eb(a)] || "object"
        }

        function cb(a) {
            for (var b in a) return d
        }

        function C(a) {
            try {
                return F(a) == "object" && !a.nodeType && a != a.window && (!a.constructor || {}.hasOwnProperty.call(a.constructor.prototype, "isPrototypeOf"))
            } catch (b) {}
        }

        function jb(b, a) {
            setTimeout(b, a || 0)
        }

        function ab(b, d, c) {
            var a = !b || b == "inherit" ? "" : b;
            l(d, function(c) {
                var b = c.exec(a);
                if (b) {
                    var d = a.substr(0, b.index),
                        e = a.substr(b.index + b[0].length + 1, a.length - 1);
                    a = d + e
                }
            });
            a && (c += (!a.indexOf(" ") ? "" : " ") + a);
            return c
        }

        function gb(a, b) {
            if (a === e) a = b;
            return a
        }
        j.Wc = Eb;
        j.Xd = v;
        j.ug = qb;
        j.og = I;
        nb("transform");
        j.gd = function() {
            return n
        };
        j.ac = jb;
        j.L = gb;
        j.bb = function(a, b) {
            b.call(a);
            return z({}, a)
        };

        function U(a) {
            a.constructor === U.caller && a.q && a.q.apply(a, U.caller.arguments)
        }
        j.q = U;
        j.Fb = function(a) {
            if (j.rg(a)) a = i.getElementById(a);
            return a
        };

        function t(a) {
            return a || g.event
        }
        j.sg = t;
        j.Gb = function(b) {
            b = t(b);
            var a = b.target || b.srcElement || i;
            if (a.nodeType == 3) a = j.ed(a);
            return a
        };
        j.Nd = function(a) {
            a = t(a);
            return a.relatedTarget || a.toElement
        };
        j.Md = function(a) {
            a = t(a);
            return a.which || ([0, 1, 3, 0, 2])[a.button] || a.charCode || a.keyCode
        };
        j.Rc = function(a) {
            a = t(a);
            return {
                x: a.clientX || 0,
                y: a.clientY || 0
            }
        };
        j.vg = function(b, a) {
            return b.x >= a.x && b.x <= a.x + a.w && b.y >= a.y && b.y <= a.y + a.h
        };
        j.Zd = function(c, e) {
            var a = b.xg(e),
                d = b.Rc(c);
            return j.vg(d, a)
        };

        function w(c, d, a) {
            if (a !== e) c.style[d] = a == e ? "" : a;
            else {
                var b = c.currentStyle || c.style;
                a = b[d];
                if (a == "" && g.getComputedStyle) {
                    b = c.ownerDocument.defaultView.getComputedStyle(c, f);
                    b && (a = b.getPropertyValue(d) || b[d])
                }
                return a
            }
        }

        function X(b, c, a, d) {
            if (a === e) {
                a = q(w(b, c));
                isNaN(a) && (a = f);
                return a
            }
            if (a == f) a = "";
            else d && (a += "px");
            w(b, c, a)
        }

        function m(c, a) {
            var d = a ? X : w,
                b;
            if (a & 4) b = lb(c);
            return function(e, f) {
                return d(e, b ? b(e) : c, f, a & 2)
            }
        }

        function zb(a) {
            return q(a.style.opacity || "1")
        }

        function Bb(b, a) {
            b.style.opacity = a == 1 || a == f ? "" : c.D(a * 100) / 100
        }
        var N = {
            Z: ["rotate"],
            lb: ["rotateX"],
            hb: ["rotateY"],
            cc: ["skewX"],
            bc: ["skewY"]
        };
        if (!I()) N = z(N, {
            O: ["scaleX", 2],
            N: ["scaleY", 2],
            ib: ["translateZ", 1]
        });

        function M(c, a) {
            var b = "";
            if (a) {
                if (v() && n && n < 10) {
                    delete a.lb;
                    delete a.hb;
                    delete a.ib
                }
                l(a, function(d, c) {
                    var a = N[c];
                    if (a) {
                        var e = a[1] || 0;
                        if (O[c] != d) b += " " + a[0] + "(" + d + (["deg", "px", ""])[e] + ")"
                    }
                });
                if (I()) {
                    if (a.Eb || a.Jb || a.ib != e) b += " translate3d(" + (a.Eb || 0) + "px," + (a.Jb || 0) + "px," + (a.ib || 0) + "px)";
                    if (a.O == e) a.O = 1;
                    if (a.N == e) a.N = 1;
                    if (a.O != 1 || a.N != 1) b += " scale3d(" + a.O + ", " + a.N + ", 1)"
                }
            }
            c.style[L(c)] = b
        }
        j.zg = m("transformOrigin", 4);
        j.Ag = m("backfaceVisibility", 4);
        j.Yb = m("transformStyle", 4);
        j.Cg = m("perspective", 6);
        j.Dg = m("perspectiveOrigin", 4);
        j.Ud = function(b, a) {
            if (v() && n < 9) b.style.zoom = a == 1 ? "" : a;
            else {
                var c = L(b),
                    f = a == 1 ? "" : "scale(" + a + ")",
                    e = b.style[c],
                    g = new RegExp(/[\s]*scale\(.*?\)/g),
                    d = ab(e, [g], f);
                b.style[c] = d
            }
        };
        j.jb = function(a, d, b, c) {
            a = j.Fb(a);
            if (a.addEventListener) {
                d == "mousewheel" && a.addEventListener("DOMMouseScroll", b, c);
                a.addEventListener(d, b, c)
            } else if (a.attachEvent) {
                a.attachEvent("on" + d, b);
                c && a.setCapture && a.setCapture()
            }
        };
        j.Cb = function(a, c, d, b) {
            a = j.Fb(a);
            if (a.removeEventListener) {
                c == "mousewheel" && a.removeEventListener("DOMMouseScroll", d, b);
                a.removeEventListener(c, d, b)
            } else if (a.detachEvent) {
                a.detachEvent("on" + c, d);
                b && a.releaseCapture && a.releaseCapture()
            }
        };
        j.Bb = function(a) {
            a = t(a);
            a.preventDefault && a.preventDefault();
            a.cancel = d;
            a.returnValue = k
        };
        j.mg = function(a) {
            a = t(a);
            a.stopPropagation && a.stopPropagation();
            a.cancelBubble = d
        };
        j.W = function(d, c) {
            var a = [].slice.call(arguments, 2),
                b = function() {
                    var b = a.concat([].slice.call(arguments, 0));
                    return c.apply(d, b)
                };
            return b
        };
        j.Zf = function(a, b) {
            if (b == e) return a.textContent || a.innerText;
            var c = i.createTextNode(b);
            j.Tb(a);
            a.appendChild(c)
        };
        j.xg = function(b) {
            var a = b.getBoundingClientRect();
            return {
                x: a.left,
                y: a.top,
                w: a.right - a.left,
                h: a.bottom - a.top
            }
        };
        j.yb = function(d, c) {
            for (var b = [], a = d.firstChild; a; a = a.nextSibling)(c || a.nodeType == 1) && b.push(a);
            return b
        };

        function db(a, c, e, b) {
            b = b || "u";
            for (a = a ? a.firstChild : f; a; a = a.nextSibling)
                if (a.nodeType == 1) {
                    if (D(a, b) == c) return a;
                    if (!e) {
                        var d = db(a, c, e, b);
                        if (d) return d
                    }
                }
        }
        j.ae = db;

        function S(a, d, g, b) {
            b = b || "u";
            var c = [];
            for (a = a ? a.firstChild : f; a; a = a.nextSibling)
                if (a.nodeType == 1) {
                    D(a, b) == d && c.push(a);
                    if (!g) {
                        var e = S(a, d, g, b);
                        if (e.length) c = c.concat(e)
                    }
                } return c
        }
        j.Vf = function(b, a) {
            return b.getElementsByTagName(a)
        };
        j.cb = function(a, f, d, g) {
            d = d || "u";
            var e;
            do {
                if (a.nodeType == 1) {
                    var c;
                    d && (c = D(a, d));
                    if (c && c == gb(f, c) || g == a.tagName) {
                        e = a;
                        break
                    }
                }
                a = b.ed(a)
            } while (a && a != i.body);
            return e
        };
        j.Wf = function(a) {
            return W(["INPUT", "TEXTAREA", "SELECT"])[a.tagName]
        };

        function z() {
            var f = arguments,
                d, c, b, a, h = 1 & f[0],
                g = 1 + h;
            d = f[g - 1] || {};
            for (; g < f.length; g++)
                if (c = f[g])
                    for (b in c) {
                        a = c[b];
                        if (a !== e) {
                            a = c[b];
                            var i = d[b];
                            d[b] = h && (C(i) || C(a)) ? z(h, {}, i, a) : a
                        }
                    }
            return d
        }
        j.gb = z;

        function V(f, g) {
            var d = {},
                c, a, b;
            for (c in f) {
                a = f[c];
                b = g[c];
                if (a !== b) {
                    var e;
                    if (C(a) && C(b)) {
                        a = V(a, b);
                        e = !cb(a)
                    }!e && (d[c] = a)
                }
            }
            return d
        }
        j.Jd = function(a) {
            return F(a) == "function"
        };
        j.Yf = function(a) {
            return F(a) == "array"
        };
        j.rg = function(a) {
            return F(a) == "string"
        };
        j.Hc = function(a) {
            return !isNaN(q(a)) && isFinite(a)
        };
        j.c = l;
        j.cf = C;

        function Q(a) {
            return i.createElement(a)
        }
        j.Lc = function() {
            return Q("DIV")
        };
        j.kg = function() {
            return Q("SPAN")
        };
        j.Ne = function() {};

        function E(b, c, a) {
            if (a == e) return b.getAttribute(c);
            b.setAttribute(c, a)
        }

        function D(a, b) {
            return E(a, b) || E(a, "data-" + b)
        }
        j.k = E;
        j.P = D;
        j.l = function(d, b, c) {
            var a = j.cg(D(d, b));
            if (isNaN(a)) a = c;
            return a
        };

        function x(b, a) {
            return E(b, "class", a) || ""
        }

        function W(b) {
            var a = {};
            l(b, function(b) {
                if (b != e) a[b] = b
            });
            return a
        }

        function kb(b, a) {
            return b.match(a || vb)
        }

        function P(b, a) {
            return W(kb(b || "", a))
        }
        j.nd = W;
        j.eg = kb;
        j.fg = function(a) {
            a && (a = a.toLowerCase());
            return a
        };

        function Y(b, c) {
            var a = "";
            l(c, function(c) {
                a && (a += b);
                a += c
            });
            return a
        }

        function J(a, c, b) {
            x(a, Y(" ", z(V(P(x(a)), P(c)), P(b))))
        }
        j.ed = function(a) {
            return a.parentNode
        };
        j.Mb = function(a) {
            j.nb(a, "none")
        };
        j.Lb = function(a, b) {
            j.nb(a, b ? "none" : "")
        };
        j.hg = function(b, a) {
            b.removeAttribute(a)
        };
        j.ig = function(d, a) {
            if (a) d.style.clip = "rect(" + c.D(a.g || a.E || 0) + "px " + c.D(a.u) + "px " + c.D(a.s) + "px " + c.D(a.i || a.F || 0) + "px)";
            else if (a !== e) {
                var h = d.style.cssText,
                    g = [new RegExp(/[\s]*clip: rect\(.*?\)[;]?/i), new RegExp(/[\s]*cliptop: .*?[;]?/i), new RegExp(/[\s]*clipright: .*?[;]?/i), new RegExp(/[\s]*clipbottom: .*?[;]?/i), new RegExp(/[\s]*clipleft: .*?[;]?/i)],
                    f = ab(h, g, "");
                b.Fd(d, f)
            }
        };
        j.jg = function(b, a) {
            if (a) b.style.backgroundColor = "rgba(" + c.D(a.Hd) + "," + c.D(a.td) + "," + c.D(a.zd) + "," + a.T + ")"
        };
        j.Qb = function() {
            return +new Date
        };
        j.ab = function(b, a) {
            b.appendChild(a)
        };
        j.ob = function(b, a, c) {
            (c || a.parentNode).insertBefore(b, a)
        };
        j.Nb = function(b, a) {
            a = a || b.parentNode;
            a && a.removeChild(b)
        };
        j.Ve = function(a, b) {
            l(a, function(a) {
                j.Nb(a, b)
            })
        };
        j.Tb = function(a) {
            j.Ve(j.yb(a, d), a)
        };

        function hb() {
            l([].slice.call(arguments, 0), function(a) {
                if (j.Yf(a)) hb.apply(f, a);
                else a && a.m()
            })
        }
        j.m = hb;
        j.kd = function(a, b) {
            var c = j.ed(a);
            if (b & 1) {
                j.V(a, (j.G(c) - j.G(a)) / 2);
                j.pd(a, f)
            }
            if (b & 2) {
                j.R(a, (j.B(c) - j.B(a)) / 2);
                j.ld(a, f)
            }
        };
        var R = {
            g: f,
            u: f,
            s: f,
            i: f,
            U: f,
            S: f
        };
        j.Ge = function(a) {
            var b = j.Lc();
            s(b, {
                Ad: "block",
                Ob: j.tb(a),
                g: 0,
                i: 0,
                U: 0,
                S: 0
            });
            var d = j.Id(a, R);
            j.ob(b, a);
            j.ab(b, a);
            var e = j.Id(a, R),
                c = {};
            l(d, function(b, a) {
                if (b == e[a]) c[a] = b
            });
            s(b, R);
            s(b, c);
            s(a, {
                g: 0,
                i: 0
            });
            return c
        };
        j.ve = function(b, a) {
            return parseInt(b, a || 10)
        };
        j.cg = q;
        j.Ld = function(b, a) {
            var c = i.body;
            while (a && b !== a && c !== a) a = a.parentNode;
            return b === a
        };

        function T(d, c, b) {
            var a = d.cloneNode(!c);
            !b && j.hg(a, "id");
            return a
        }
        j.kc = T;
        j.ub = function(e, f) {
            var a = new Image;

            function b(e, d) {
                j.Cb(a, "load", b);
                j.Cb(a, "abort", c);
                j.Cb(a, "error", c);
                f && f(a, d)
            }

            function c(a) {
                b(a, d)
            }
            if (ub() && n < 11.6 || !e) b(!e);
            else {
                j.jb(a, "load", b);
                j.jb(a, "abort", c);
                j.jb(a, "error", c);
                a.src = e
            }
        };
        j.Be = function(e, a, d) {
            var b = 1;

            function c(c) {
                b--;
                if (a && c && c.src == a.src) a = c;
                !b && d && d(a)
            }
            l(e, function(a) {
                if (a.src) {
                    b++;
                    j.ub(a.src, c)
                }
            });
            c()
        };
        j.Le = function(a, g, i, h) {
            if (h) a = T(a);
            var c = S(a, g);
            if (!c.length) c = b.Vf(a, g);
            for (var f = c.length - 1; f > -1; f--) {
                var d = c[f],
                    e = T(i);
                x(e, x(d));
                b.Fd(e, d.style.cssText);
                b.ob(e, d);
                b.Nb(d)
            }
            return a
        };

        function Cb() {
            var a = this;
            b.bb(a, o);
            var d, q = "",
                s = ["av", "pv", "ds", "dn"],
                f = [],
                r, n = 0,
                k = 0,
                h = 0;

            function m() {
                J(d, r, (f[h || k & 2 || k] || "") + " " + (f[n] || ""));
                j.mc(d, h ? "none" : "")
            }

            function c() {
                n = 0;
                a.K(g, "mouseup", c);
                a.K(i, "mouseup", c);
                a.K(i, "touchend", c);
                a.K(i, "touchcancel", c);
                a.K(g, "blur", c);
                m()
            }

            function p(b) {
                if (h) j.Bb(b);
                else {
                    n = 4;
                    m();
                    a.a(g, "mouseup", c);
                    a.a(i, "mouseup", c);
                    a.a(i, "touchend", c);
                    a.a(i, "touchcancel", c);
                    a.a(g, "blur", c)
                }
            }
            a.Me = function(a) {
                if (a === e) return k;
                k = a & 2 || a & 1;
                m()
            };
            a.Nc = function(a) {
                if (a === e) return !h;
                h = a ? 0 : 3;
                m()
            };
            a.q = function(e) {
                a.Q = d = j.Fb(e);
                E(d, "data-jssor-button", "1");
                var c = b.eg(x(d));
                if (c) q = c.shift();
                l(s, function(a) {
                    f.push(q + a)
                });
                r = Y(" ", f);
                f.unshift("");
                a.a(d, "mousedown", p);
                a.a(d, "touchstart", p)
            };
            b.q(a)
        }
        j.Ac = function(a) {
            return new Cb(a)
        };
        j.I = w;
        m("backgroundColor");
        j.Pc = m("overflow");
        j.mc = m("pointerEvents");
        j.R = m("top", 2);
        j.pd = m("right", 2);
        j.ld = m("bottom", 2);
        j.V = m("left", 2);
        j.G = m("width", 2);
        j.B = m("height", 2);
        m("marginLeft", 2);
        m("marginTop", 2);
        j.tb = m("position");
        j.nb = m("display");
        j.J = m("zIndex", 1);
        j.Ce = function(b, a, c) {
            if (a !== e) Bb(b, a, c);
            else return zb(b)
        };
        j.Fd = function(a, b) {
            if (b != e) a.style.cssText = b;
            else return a.style.cssText
        };
        j.Ie = function(b, a) {
            if (a === e) {
                a = w(b, "backgroundImage") || "";
                var c = /\burl\s*\(\s*["']?([^"'\r\n,]+)["']?\s*\)/gi.exec(a) || [];
                return c[1]
            }
            w(b, "backgroundImage", a ? "url('" + a + "')" : "")
        };
        var K;
        j.Je = K = {
            T: j.Ce,
            g: j.R,
            u: j.pd,
            s: j.ld,
            i: j.V,
            U: j.G,
            S: j.B,
            Ob: j.tb,
            Ad: j.nb,
            Db: j.J
        };
        j.Id = function(c, b) {
            var a = {};
            l(b, function(d, b) {
                if (K[b]) a[b] = K[b](c)
            });
            return a
        };

        function s(b, h) {
            var a = I(),
                d = mb(),
                g = L(b);

            function c(l, a) {
                a = a || {};
                var h = a.ib || 0,
                    i = (a.lb || 0) % 360,
                    j = (a.hb || 0) % 360,
                    k = (a.Z || 0) % 360,
                    c = a.O,
                    d = a.N,
                    f = a.Mg;
                if (c == e) c = 1;
                if (d == e) d = 1;
                if (f == e) f = 1;
                var b = new yb(a.Eb, a.Jb, h);
                b.qc(c, d, f);
                b.te(a.cc, a.bc);
                b.lb(i);
                b.hb(j);
                b.re(k);
                b.pc(a.F, a.E);
                l.style[g] = b.ue()
            }
            s = function(g, b) {
                b = b || {};
                var i = b.F,
                    k = b.E,
                    h;
                l(K, function(a, c) {
                    h = b[c];
                    h !== e && a(g, h)
                });
                j.ig(g, b.f);
                j.jg(g, b.pb);
                if (!a) {
                    i != e && j.V(g, (b.Sd || 0) + i);
                    k != e && j.R(g, (b.Td || 0) + k)
                }
                if (b.He)
                    if (d) jb(j.W(f, M, g, b));
                    else if (a) c(g, b);
                else M(g, b)
            };
            j.db = s;
            s(b, h)
        }
        j.db = s;

        function yb(j, k, n) {
            var d = this,
                b = [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, j || 0, k || 0, n || 0, 1],
                i = c.sb,
                h = c.gc,
                l = c.jd;

            function g(a) {
                return a * c.C / 180
            }

            function m(c, e, l, m, o, r, t, u, w, z, A, C, E, b, f, k, a, g, i, n, p, q, s, v, x, y, B, D, F, d, h, j) {
                return [c * a + e * p + l * x + m * F, c * g + e * q + l * y + m * d, c * i + e * s + l * B + m * h, c * n + e * v + l * D + m * j, o * a + r * p + t * x + u * F, o * g + r * q + t * y + u * d, o * i + r * s + t * B + u * h, o * n + r * v + t * D + u * j, w * a + z * p + A * x + C * F, w * g + z * q + A * y + C * d, w * i + z * s + A * B + C * h, w * n + z * v + A * D + C * j, E * a + b * p + f * x + k * F, E * g + b * q + f * y + k * d, E * i + b * s + f * B + k * h, E * n + b * v + f * D + k * j]
            }

            function e(c, a) {
                return m.apply(f, (a || b).concat(c))
            }
            d.qc = function(a, c, d) {
                if (a != 1 || c != 1 || d != 1) b = e([a, 0, 0, 0, 0, c, 0, 0, 0, 0, d, 0, 0, 0, 0, 1])
            };
            d.pc = function(a, c, d) {
                b[12] += a || 0;
                b[13] += c || 0;
                b[14] += d || 0
            };
            d.lb = function(c) {
                if (c) {
                    a = g(c);
                    var d = h(a),
                        f = i(a);
                    b = e([1, 0, 0, 0, 0, d, f, 0, 0, -f, d, 0, 0, 0, 0, 1])
                }
            };
            d.hb = function(c) {
                if (c) {
                    a = g(c);
                    var d = h(a),
                        f = i(a);
                    b = e([d, 0, -f, 0, 0, 1, 0, 0, f, 0, d, 0, 0, 0, 0, 1])
                }
            };
            d.re = function(c) {
                if (c) {
                    a = g(c);
                    var d = h(a),
                        f = i(a);
                    b = e([d, f, 0, 0, -f, d, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1])
                }
            };
            d.te = function(a, c) {
                if (a || c) {
                    j = g(a);
                    k = g(c);
                    b = e([1, l(k), 0, 0, l(j), 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1])
                }
            };
            d.ue = function() {
                return "matrix3d(" + b.join(",") + ")"
            }
        }
        var O = {
            Sd: 0,
            Td: 0,
            F: 0,
            E: 0,
            zb: 1,
            O: 1,
            N: 1,
            Z: 0,
            lb: 0,
            hb: 0,
            Eb: 0,
            Jb: 0,
            ib: 0,
            cc: 0,
            bc: 0
        };
        j.be = function(c, d) {
            var a = c || {};
            if (c)
                if (b.Jd(c)) a = {
                    L: a
                };
                else if (b.Jd(c.f)) a.f = {
                L: c.f
            };
            a.L = a.L || d;
            if (a.f) a.f.L = a.f.L || d;
            if (a.pb) a.pb.L = a.pb.L || d;
            return a
        };

        function ib(c, a) {
            var b = {};
            l(c, function(c, d) {
                var f = c;
                if (a[d] != e)
                    if (j.Hc(c)) f = c + a[d];
                    else f = ib(c, a[d]);
                b[d] = f
            });
            return b
        }
        j.ke = ib;
        j.Fe = function(o, j, s, t, E, F, p) {
            var a = j;
            if (o) {
                a = {};
                for (var i in j) {
                    var G = F[i] || 1,
                        B = E[i] || [0, 1],
                        g = (s - B[0]) / B[1];
                    g = c.v(c.H(g, 0), 1);
                    g = g * G;
                    var y = c.X(g);
                    if (g != y) g -= y;
                    var k = t.L || h.Ub,
                        m, C = o[i],
                        r = j[i];
                    if (b.Hc(r)) {
                        k = t[i] || k;
                        var D = k(g);
                        m = C + r * D
                    } else {
                        m = z({
                            ec: {}
                        }, o[i]);
                        var A = t[i] || {};
                        l(r.ec || r, function(d, a) {
                            k = A[a] || A.L || k;
                            var c = k(g),
                                b = d * c;
                            m.ec[a] = b;
                            m[a] += b
                        })
                    }
                    a[i] = m
                }
                var x = l(j, function(b, a) {
                    return O[a] != e
                });
                x && l(O, function(c, b) {
                    if (a[b] == e && o[b] !== e) a[b] = o[b]
                });
                if (x) {
                    if (a.zb) a.O = a.N = a.zb;
                    a.xb = p.xb;
                    a.wb = p.wb;
                    if (v() && n >= 11 && (j.F || j.E) && s != 0 && s != 1) a.Z = a.Z || 1e-8;
                    a.He = d
                }
            }
            if (j.f && p.pc) {
                var q = a.f.ec,
                    w = (q.g || 0) + (q.s || 0),
                    u = (q.i || 0) + (q.u || 0);
                a.i = (a.i || 0) + u;
                a.g = (a.g || 0) + w;
                a.f.i -= u;
                a.f.u -= u;
                a.f.g -= w;
                a.f.s -= w
            }
            if (a.f && !a.f.g && !a.f.i && !a.f.E && !a.f.F && a.f.u == p.xb && a.f.s == p.wb) a.f = f;
            return a
        }
    };

    function o() {
        var a = this,
            f, e = [],
            c = [];

        function k(a, b) {
            e.push({
                Kb: a,
                vb: b
            })
        }

        function j(a, c) {
            b.c(e, function(b, d) {
                b.Kb == a && b.vb === c && e.splice(d, 1)
            })
        }

        function i() {
            e = []
        }

        function h() {
            b.c(c, function(a) {
                b.Cb(a.md, a.Kb, a.vb, a.hd)
            });
            c = []
        }
        a.Sc = function() {
            return f
        };
        a.a = function(e, a, d, f) {
            b.jb(e, a, d, f);
            c.push({
                md: e,
                Kb: a,
                vb: d,
                hd: f
            })
        };
        a.K = function(e, a, d, f) {
            b.c(c, function(g, h) {
                if (g.md === e && g.Kb == a && g.vb === d && g.hd == f) {
                    b.Cb(e, a, d, f);
                    c.splice(h, 1)
                }
            })
        };
        a.sd = h;
        a.Uc = a.addEventListener = k;
        a.removeEventListener = j;
        a.j = function(a) {
            var c = [].slice.call(arguments, 1);
            b.c(e, function(b) {
                b.Kb == a && b.vb.apply(g, c)
            })
        };
        a.m = function() {
            if (!f) {
                f = d;
                h();
                i()
            }
        }
    }
    var l = function(C, D, i, m, R, Q) {
        C = C || 0;
        var a = this,
            p, n, o, s, F = 0,
            O = 1,
            L, M, K, G, B = 0,
            j = 0,
            r = 0,
            A, l, f, h, q, z, u = [],
            y, I = k,
            J, H = k;

        function T(a) {
            f += a;
            h += a;
            l += a;
            j += a;
            r += a;
            B += a
        }

        function x(C) {
            var k = C;
            if (q)
                if (!z && (k >= h || k < f) || z && k >= f) k = ((k - f) % q + q) % q + f;
            if (!A || s || j != k) {
                var g = c.v(k, h);
                g = c.H(g, f);
                if (i.Vc) g = h - g + f;
                if (!A || s || g != r) {
                    if (Q) {
                        var x = (g - l) / (D || 1),
                            o = b.Fe(R, Q, x, L, K, M, i);
                        if (y) b.c(o, function(b, a) {
                            y[a] && y[a](m, b)
                        });
                        else b.db(m, o);
                        var n;
                        if (J) {
                            var p = g > f && g < h;
                            if (p != H) n = H = p
                        }
                        if (!n && o.T != e) {
                            var t = o.T < .001;
                            if (t != I) n = I = t
                        }
                        if (n != e) {
                            n && b.mc(m, "none");
                            !n && b.mc(m, b.k(m, "data-events"))
                        }
                    }
                    var w = r,
                        v = r = g;
                    b.c(u, function(b, c) {
                        var a = !A && z || k <= j ? u[u.length - c - 1] : b;
                        a.A(g - B)
                    });
                    j = k;
                    A = d;
                    a.Xc(w - l, v - l);
                    a.Ib(w, v)
                }
            }
        }

        function E(a, b, d) {
            b && a.ic(h);
            if (!d) {
                f = c.v(f, a.hc() + B);
                h = c.H(h, a.eb() + B)
            }
            u.push(a)
        }
        var v = g.requestAnimationFrame || g.webkitRequestAnimationFrame || g.mozRequestAnimationFrame || g.msRequestAnimationFrame;
        if (b.ug() && b.gd() < 7 || !v) v = function(a) {
            b.ac(a, i.ud)
        };

        function N() {
            if (p) {
                var d = b.Qb(),
                    e = c.v(d - F, i.vd),
                    a = j + e * o * O;
                F = d;
                if (a * o >= n * o) a = n;
                x(a);
                if (!s && a * o >= n * o) P(G);
                else v(N)
            }
        }

        function w(e, g, i) {
            if (!p) {
                p = d;
                s = i;
                G = g;
                e = c.H(e, f);
                e = c.v(e, h);
                n = e;
                o = n < j ? -1 : 1;
                a.Yc();
                F = b.Qb();
                v(N)
            }
        }

        function P(b) {
            if (p) {
                s = p = G = k;
                a.Zc();
                b && b()
            }
        }
        a.xd = function(a, b, c) {
            w(a ? j + a : h, b, c)
        };
        a.lc = w;
        a.Ee = function(a, b) {
            w(h, a, b)
        };
        a.z = P;
        a.Bd = function() {
            return j
        };
        a.Cd = function() {
            return n
        };
        a.n = function() {
            return r
        };
        a.A = x;
        a.De = function() {
            x(h, d)
        };
        a.cd = function() {
            return p
        };
        a.id = function(a) {
            O = a
        };
        a.ic = T;
        a.M = function(a, b) {
            E(a, 0, b)
        };
        a.Oc = function(a) {
            E(a, 1)
        };
        a.Dc = function(a) {
            h += a
        };
        a.hc = function() {
            return f
        };
        a.eb = function() {
            return h
        };
        a.Ib = a.Yc = a.Zc = a.Xc = b.Ne;
        a.ad = b.Qb();
        i = b.gb({
            ud: 16,
            vd: 50
        }, i);
        m && (J = b.k(m, "data-inactive"));
        q = i.Wb;
        z = i.ye;
        y = i.xe;
        f = l = C;
        h = C + D;
        M = i.D || {};
        K = i.ze || {};
        L = b.be(i.fb)
    };
    var n = {
            le: "data-scale",
            Hb: "data-autocenter",
            sc: "data-nofreeze",
            Od: "data-nodrag"
        },
        q = new function() {
            var a = this;
            a.xc = function(c, a, e, d) {
                (d || !b.k(c, a)) && b.k(c, a, e)
            };
            a.yc = function(a) {
                var c = b.l(a, n.Hb);
                b.kd(a, c)
            }
        };
    new(function() {});
    var r = {
            Gc: 1
        },
        u = function() {
            var a = this,
                D = b.bb(a, o),
                h, v, C, B, m, l = 0,
                g, s, p, z, A, i, k, u, t, x, j;

            function y(a) {
                j[a] && j[a].Me(a == l)
            }

            function w(b) {
                a.j(r.Gc, b * s)
            }
            a.vc = function(a) {
                if (a != m) {
                    var d = l,
                        b = c.X(a / s);
                    l = b;
                    m = a;
                    y(d);
                    y(b)
                }
            };
            a.Ic = function(a) {
                b.Lb(h, a)
            };
            a.uc = function(I) {
                b.m(j);
                m = e;
                a.sd();
                x = [];
                j = [];
                b.Tb(h);
                v = c.qb(I / s);
                l = 0;
                var H = u + z,
                    y = t + A,
                    r = c.qb(v / p) - 1;
                C = u + H * (!i ? r : p - 1);
                B = t + y * (i ? r : p - 1);
                b.G(h, C);
                b.B(h, B);
                for (var n = 0; n < v; n++) {
                    var D = b.kg();
                    b.Zf(D, n + 1);
                    var o = b.Le(k, "numbertemplate", D, d);
                    b.tb(o, "absolute");
                    var G = n % (r + 1),
                        E = c.X(n / (r + 1)),
                        F = g.Vb && !i ? r - G : G;
                    b.V(o, (!i ? F : E) * H);
                    b.R(o, (i ? F : E) * y);
                    b.ab(h, o);
                    x[n] = o;
                    g.zc & 1 && a.a(o, "click", b.W(f, w, n));
                    g.zc & 2 && a.a(o, "mouseenter", b.W(f, w, n));
                    j[n] = b.Ac(o)
                }
                q.yc(h)
            };
            a.q = function(d, c) {
                a.Q = h = b.Fb(d);
                a.dd = g = b.gb({
                    Qd: 10,
                    Wd: 10,
                    zc: 1
                }, c);
                k = b.ae(h, "prototype");
                u = b.G(k);
                t = b.B(k);
                b.Nb(k, h);
                s = g.Dd || 1;
                p = g.fe || 1;
                z = g.Qd;
                A = g.Wd;
                i = g.qe & 2;
                g.mb && q.xc(h, n.Hb, g.mb)
            };
            a.m = function() {
                b.m(j, D)
            };
            b.q(a)
        },
        v = function() {
            var a = this,
                v = b.bb(a, o),
                e, c, g, l, s, k, h, m, j, i;

            function p(b) {
                a.j(r.Gc, b, d)
            }

            function u(a) {
                b.Lb(e, a);
                b.Lb(c, a)
            }

            function t() {
                j.Nc((g.Pb || !l.me(h)) && k > 1);
                i.Nc((g.Pb || !l.pe(h)) && k > 1)
            }
            a.vc = function(c, a, b) {
                h = a;
                !b && t()
            };
            a.Ic = u;
            a.uc = function(g) {
                k = g;
                h = 0;
                if (!s) {
                    a.a(e, "click", b.W(f, p, -m));
                    a.a(c, "click", b.W(f, p, m));
                    j = b.Ac(e);
                    i = b.Ac(c);
                    b.k(e, n.sc, 1);
                    b.k(c, n.sc, 1);
                    s = d
                }
            };
            a.q = function(f, d, h, i) {
                a.dd = g = b.gb({
                    Dd: 1
                }, h);
                e = f;
                c = d;
                if (g.Vb) {
                    e = d;
                    c = f
                }
                m = g.Dd;
                l = i;
                if (g.mb) {
                    q.xc(e, n.Hb, g.mb);
                    q.xc(c, n.Hb, g.mb)
                }
                q.yc(e);
                q.yc(c)
            };
            a.m = function() {
                b.m(j, i, v)
            };
            b.q(a)
        };

    function p(e, d, c) {
        var a = this;
        b.bb(a, o);
        l.call(a, 0, c.Rb);
        a.oc = 0;
        a.Ec = c.Rb
    }
    p.wc = 21;
    p.jc = 24;
    var s = function() {
            var a = this,
                hb = b.bb(a, o);
            l.call(a, 0, 0);
            var e, t, gb = [h.Ub, h.Re, h.Qe, h.Vd, h.lf, h.of, h.Jf, h.If, h.Hf, h.Gf, h.Ff, h.zf, h.Pd, h.ng, h.jf, h.pf, h.qf, h.rf, h.sf, h.tf, h.uf, h.vf, h.wf, h.xf, h.yf, h.Af, h.Bf, h.Cf, h.Df, h.qd, h.fd, h.Ef, h.Kf, h.nf],
                P = {},
                S, C, u = new l(0, 0),
                T = [],
                x = [],
                E, q = 0;

            function G(d, c) {
                var a = {};
                b.c(d, function(d, f) {
                    var e = P[f];
                    if (e) {
                        if (b.cf(d)) d = G(d, c || f == "e");
                        else if (c)
                            if (b.Hc(d)) d = gb[d];
                        a[e] = d
                    }
                });
                return a
            }

            function I(c, f) {
                var e = [],
                    d = b.l(c, "play");
                if (f && d) {
                    var g = new s(c, t, {
                        gg: d
                    });
                    N.push(g);
                    a.a(g, p.wc, Z);
                    a.a(g, p.jc, U)
                } else b.c(b.yb(c), function(a) {
                    e = e.concat(I(a, f + 1))
                });
                if (!f && (!j || j & 16) || f && (!d || !(d & 16))) {
                    var h = S[b.l(c, "t")];
                    h && e.push({
                        Q: c,
                        rc: h
                    })
                }
                return e
            }

            function O(c, e) {
                var a = T[c];
                if (a == f) {
                    a = T[c] = {
                        kb: c,
                        Jc: [],
                        Kd: []
                    };
                    var d = 0;
                    !b.c(x, function(a, b) {
                        d = b;
                        return a.kb > c
                    }) && d++;
                    x.splice(d, 0, a)
                }
                return a
            }

            function db(o, p, g) {
                var a, e;
                if (C) {
                    var k = C[b.l(o, "c")];
                    if (k) {
                        a = O(k.r, 0);
                        a.ag = k.e || 0
                    }
                }
                b.c(p, function(h) {
                    var f = b.gb(d, {}, G(h)),
                        i = b.be(f.fb);
                    delete f.fb;
                    if (f.i) {
                        f.F = f.i;
                        i.F = i.i;
                        delete f.i
                    }
                    if (f.g) {
                        f.E = f.g;
                        i.E = i.g;
                        delete f.g
                    }
                    var m = {
                            fb: i,
                            xb: g.U,
                            wb: g.S
                        },
                        j = new l(h.b, h.d, m, o, g, f);
                    q = c.H(q, h.b + h.d);
                    if (a) {
                        if (!e) e = new l(h.b, 0);
                        e.M(j)
                    } else {
                        var k = O(h.b, h.b + h.d);
                        k.Jc.push(j)
                    }
                    if (f.pb) g.pb = {
                        Hd: 0,
                        td: 0,
                        zd: 0,
                        T: 0
                    };
                    g = b.ke(g, f)
                });
                if (a && e) {
                    e.De();
                    var h = e,
                        i, j = e.hc(),
                        m = e.eb(),
                        n = c.H(m, a.ag);
                    if (a.kb < m) {
                        if (a.kb > j) {
                            h = new l(j, a.kb - j);
                            h.M(e, d)
                        } else h = f;
                        i = new l(a.kb, n - j, {
                            Wb: n - a.kb,
                            ye: d
                        });
                        i.M(e, d)
                    }
                    h && a.Jc.push(h);
                    i && a.Kd.push(i)
                }
                return g
            }

            function cb(a) {
                b.c(a, function(d) {
                    var a = d.Q,
                        f = b.G(a),
                        e = b.B(a),
                        c = {
                            i: b.V(a),
                            g: b.R(a),
                            F: 0,
                            E: 0,
                            T: 1,
                            Db: b.J(a) || 0,
                            Z: 0,
                            lb: 0,
                            hb: 0,
                            O: 1,
                            N: 1,
                            Eb: 0,
                            Jb: 0,
                            ib: 0,
                            cc: 0,
                            bc: 0,
                            U: f,
                            S: e,
                            f: {
                                g: 0,
                                u: f,
                                s: e,
                                i: 0
                            }
                        };
                    c.Sd = c.i;
                    c.Td = c.g;
                    db(a, d.rc, c)
                })
            }

            function fb(f, e, g) {
                var c = f.b - e;
                if (c) {
                    var b = new l(e, c);
                    b.M(u, d);
                    b.ic(g);
                    a.M(b)
                }
                a.Dc(f.d);
                return c
            }

            function eb(e) {
                var c = u.hc(),
                    d = 0;
                b.c(e, function(e, f) {
                    e = b.gb({
                        d: 3e3
                    }, e);
                    fb(e, c, d);
                    c = e.b;
                    d += e.d;
                    if (!f || e.t == 2) {
                        a.oc = c;
                        a.Ec = c + e.d
                    }
                })
            }

            function B(g, e, d) {
                var f = e.length;
                if (f > 4)
                    for (var j = c.qb(f / 4), a = 0; a < j; a++) {
                        var h = e.slice(a * 4, c.v(a * 4 + 4, f)),
                            i = new l(h[0].kb, 0);
                        B(i, h, d);
                        g.M(i)
                    } else b.c(e, function(a) {
                        b.c(d ? a.Kd : a.Jc, function(a) {
                            d && a.Dc(q - a.eb());
                            g.M(a)
                        })
                    })
            }
            var j, F, v = 0,
                g, z, K, J, A, N = [],
                H = [],
                r, D, m;

            function y(a) {
                return a & 2 || a & 4 && b.Wc().Tc
            }

            function ab() {
                if (!A) {
                    g & 8 && a.a(i, "keydown", Q);
                    if (g & 32) {
                        a.a(i, "mousedown", w);
                        a.a(i, "touchstart", w)
                    }
                    A = d
                }
            }

            function Y() {
                a.K(i, "keydown", Q);
                a.K(i, "mousedown", w);
                a.K(i, "touchstart", w);
                A = k
            }

            function L(b) {
                if (!r || b) {
                    r = d;
                    a.z();
                    b && v && a.A(0);
                    a.id(1);
                    a.Ee();
                    ab();
                    a.j(p.wc, a)
                }
            }

            function n() {
                if (!D && (r || a.n())) {
                    D = d;
                    a.z();
                    a.Bd() > a.oc && a.A(a.oc);
                    a.id(K || 1);
                    a.lc(0)
                }
            }

            function V() {
                !m && n()
            }

            function M(c) {
                var b = c;
                if (c < 0 && a.n()) b = 1;
                if (b != v) {
                    v = b;
                    F && a.j(p.jc, a, v)
                }
            }

            function Q(a) {
                g & 8 && b.Md(a) == 27 && n()
            }

            function X(a) {
                if (m && b.Nd(a) !== f) {
                    m = k;
                    g & 16 && b.ac(V, 160)
                }
            }

            function w(a) {
                g & 32 && !b.Ld(e, b.Gb(a)) && n()
            }

            function W(a) {
                if (!m) {
                    m = d;
                    if (j & 1) b.Zd(a, e) && L()
                }
            }

            function bb(i) {
                var h = b.Gb(i),
                    a = b.cb(h, f, f, "A"),
                    c = a && (b.Wf(a) || a === e || b.Ld(e, a));
                if (r && y(g)) !c && n();
                else if (y(j)) !c && L(d)
            }

            function Z(b) {
                var c = b.Xf(),
                    a = H[c];
                a !== b && a && a.Uf();
                H[c] = b
            }

            function U(b, c) {
                a.j(p.jc, b, c)
            }
            a.Xf = function() {
                return J || ""
            };
            a.Uf = n;
            a.Yc = function() {
                M(1)
            };
            a.Zc = function() {
                r = k;
                D = k;
                M(-1);
                !a.n() && Y()
            };
            a.Ib = function() {
                !m && z && a.Bd() > a.Ec && n()
            };
            a.q = function(m, i, f) {
                e = m;
                t = i;
                j = f.gg;
                E = f.Sf;
                S = t.tc;
                C = t.Ig;
                var l = {
                    g: "y",
                    i: "x",
                    s: "m",
                    u: "t",
                    Z: "r",
                    lb: "rX",
                    hb: "rY",
                    O: "sX",
                    N: "sY",
                    Eb: "tX",
                    Jb: "tY",
                    ib: "tZ",
                    cc: "kX",
                    bc: "kY",
                    T: "o",
                    fb: "e",
                    Db: "i",
                    f: "c",
                    pb: "bc",
                    Hd: "re",
                    td: "gr",
                    zd: "bl"
                };
                b.c(l, function(b, a) {
                    P[b] = a
                });
                cb(I(e, 0));
                B(u, x);
                if (j) {
                    a.M(u);
                    E = d;
                    z = b.l(e, "idle");
                    g = b.l(e, "rollback");
                    K = b.l(e, "speed", 1);
                    J = b.P(e, "group");
                    (y(j) || y(g)) && a.a(e, "click", bb);
                    if ((j & 1 || z) && !b.Wc().Tc) {
                        a.a(e, "mouseenter", W);
                        a.a(e, "mouseleave", X)
                    }
                    F = b.l(e, "pause")
                }
                var k = t.Jg || [],
                    c = k[b.l(e, "b")] || [],
                    h = {
                        b: q,
                        d: c.length ? 0 : f.Rb || z || 0
                    };
                c = c.concat([h]);
                eb(c);
                a.eb();
                E && a.Dc(1e8);
                q = a.eb();
                B(a, x, d);
                a.A(-1);
                a.A(b.l(e, "initial") || 0)
            };
            a.m = function() {
                b.m(hb, N);
                a.z();
                a.A(-1)
            };
            b.q(a)
        },
        j = (g.module || {}).exports = function() {
            var a = this,
                xc = b.bb(a, o),
                Kb = "data-jssor-slider",
                Cc = "data-jssor-thumb",
                t, m, R, Hb, cb, tb, Z, M, K, P, Ub, zc = 1,
                qc = 1,
                Gc = 1,
                hc = 1,
                cc = {},
                w, U, Vb, Zb, Yb, Ib, Gb, Fb, gb, E = [],
                fc, u = -1,
                jc, q, I, H, L, kb, lb, F, J, hb, S, A, W, jb, Y = [],
                lc, nc, dc, s, sb, Cb, nb, eb, X, ic, Bb, Mb, Nb, G, ac = 0,
                bb = 0,
                Q = Number.MAX_VALUE,
                N = Number.MIN_VALUE,
                C, ib, db, T = 1,
                Sb = 0,
                mb, B, Ab, zb, O, xb, yb, z, V, ob, y, Jb, Xb = b.Wc(),
                Qb = Xb.Tc,
                x = [],
                D, ub, ab, bc, Ac, Ic, vb;

            function Eb() {
                return !T && X & 12
            }

            function Bc() {
                return Sb || !T && X & 3
            }

            function Db() {
                return !B && !Eb() && !y.cd()
            }

            function Rc() {
                return !Bc() && Db()
            }

            function Ec() {
                return A || R
            }

            function Kc() {
                return Ec() & 2 ? lb : kb
            }

            function Hc(a, c, d) {
                b.V(a, c);
                b.R(a, d)
            }

            function vc(c, b) {
                var a = Ec(),
                    d = (kb * b + ac) * (a & 1),
                    e = (lb * b + ac) * (a & 2) / 2;
                Hc(c, d, e)
            }

            function sc(b, f) {
                if (B && !(C & 1)) {
                    var e = b,
                        d;
                    if (b < N) {
                        e = N;
                        d = -1
                    }
                    if (b > Q) {
                        e = Q;
                        d = 1
                    }
                    if (d) {
                        var a = b - e;
                        if (f) {
                            a = c.Te(a) * 2 / c.C;
                            a = c.p(a * d, 1.6)
                        } else {
                            a = c.p(a * d, .625);
                            a = c.jd(a * c.C / 2)
                        }
                        b = e + a * d
                    }
                }
                return b
            }

            function Mc(a) {
                return sc(a, d)
            }

            function dd(a) {
                return sc(a)
            }

            function wb(a, b) {
                if (!(C & 1)) {
                    var c = a - Q + (b || 0),
                        d = N - a + (b || 0);
                    if (c > 0 && c > d) a = Q;
                    else if (d > 0) a = N
                }
                return a
            }

            function oc(a) {
                return !(C & 1) && a - N < .0001
            }

            function mc(a) {
                return !(C & 1) && Q - a < .0001
            }

            function pb(a) {
                return !(C & 1) && (a - N < .0001 || Q - a < .0001)
            }

            function Ob(c, a, d) {
                !vb && b.c(Y, function(b) {
                    b.vc(c, a, d)
                })
            }

            function uc(b) {
                var a = b,
                    d = pb(b);
                if (d) a = wb(a);
                else {
                    b = v(b);
                    a = b
                }
                a = c.X(a);
                a = c.H(a, 0);
                return a
            }

            function ad(a) {
                x[u];
                fc = u;
                u = a;
                jc = x[u]
            }

            function Pc() {
                A = 0;
                var b = z.n(),
                    d = uc(b);
                Ob(d, b);
                if (pb(b) || b == c.X(b)) {
                    if (s & 2 && (eb > 0 && d == q - 1 || eb < 0 && !d)) s = 0;
                    ad(d);
                    a.j(j.Of, u, fc)
                }
            }

            function ec(a, b) {
                if (q && (!b || !y.cd())) {
                    y.z();
                    y.Mc(a, a)
                }
            }

            function rb(a) {
                if (q) {
                    a = v(a);
                    a = wb(a);
                    ec(a)
                } else Ob(0, 0)
            }

            function Uc() {
                var b = j.Yd || 0,
                    a = ib;
                j.Yd |= a;
                return W = a & ~b
            }

            function Qc() {
                if (W) {
                    j.Yd &= ~ib;
                    W = 0
                }
            }

            function Tb(c) {
                var a = b.Lc();
                b.db(a, gb);
                c && b.Pc(a, "hidden");
                return a
            }

            function v(b, a) {
                a = a || q || 1;
                return (b % a + a) % a
            }

            function wc(c, a, b) {
                s & 8 && (s = 0);
                qb(c, Bb, a, b)
            }

            function Pb() {
                b.c(Y, function(a) {
                    a.Ic(a.dd.Kg <= T)
                })
            }

            function cd(c) {
                if (!T && (b.Nd(c) || !b.Zd(c, t))) {
                    T = 1;
                    Pb();
                    if (!B) {
                        X & 12 && Dc();
                        x[u] && x[u].dc()
                    }
                    a.j(j.yg)
                }
            }

            function bd() {
                if (T) {
                    T = 0;
                    Pb();
                    B || !(X & 12) || Fc()
                }
                a.j(j.Eg)
            }

            function Jc() {
                b.db(U, gb)
            }

            function Rb(b, a) {
                qb(b, a, d)
            }

            function qb(g, h, l, p) {
                if (q && (!B || m.Rd) && !Eb() && !isNaN(g)) {
                    var f = z.n(),
                        a = g;
                    if (l) {
                        a = f + g;
                        if (C & 2) {
                            if (oc(f) && g < 0) a = Q;
                            if (mc(f) && g > 0) a = N
                        }
                    }
                    if (!(C & 1))
                        if (p) a = v(a);
                        else a = wb(a, .5);
                    if (l && !pb(a)) a = c.D(a);
                    var j = (a - f) % q;
                    a = f + j;
                    if (h == e) h = Bb;
                    var b = c.rb(j),
                        i = 0;
                    if (b) {
                        if (b < 1) b = c.p(b, .5);
                        if (b > 1) {
                            var o = Kc(),
                                n = (R & 1 ? Gb : Fb) / o;
                            b = c.v(b, n * 1.5)
                        }
                        i = h * b
                    }
                    vb = d;
                    y.z();
                    vb = k;
                    y.Mc(f, a, i)
                }
            }

            function Nc(e, h, o) {
                var l = this,
                    i = {
                        g: 2,
                        u: 1,
                        s: 2,
                        i: 1
                    },
                    m = {
                        g: "top",
                        u: "right",
                        s: "bottom",
                        i: "left"
                    },
                    g, a, f, j, k = {};
                l.Q = e;
                l.Zb = function(q, l, u) {
                    var p, s = q,
                        r = l;
                    if (!f) {
                        f = b.Ge(e);
                        g = e.parentNode;
                        j = {
                            qc: b.l(e, n.le, 1),
                            mb: b.l(e, n.Hb)
                        };
                        b.c(m, function(c, a) {
                            k[a] = b.l(e, "data-scale-" + c, 1)
                        });
                        a = e;
                        if (h) {
                            a = b.kc(g, d);
                            b.db(a, {
                                g: 0,
                                i: 0
                            });
                            b.ab(a, e);
                            b.ab(g, a)
                        }
                    }
                    if (o) {
                        p = c.H(q, l);
                        if (h)
                            if (u >= 0 && u < 1) {
                                var w = c.v(q, l);
                                p = c.v(p / w, 1 / (1 - u)) * w
                            }
                    } else s = r = p = c.p(K < P ? l : q, j.qc);
                    var x = h ? 1.001 : 1,
                        t = p * x;
                    h && (hc = t);
                    b.Ud(a, t);
                    b.G(g, f.U * s);
                    b.B(g, f.S * r);
                    var v = b.Xd() && b.gd() < 9 ? t : 1,
                        y = (s - v) * f.U / 2,
                        z = (r - v) * f.S / 2;
                    b.V(a, y);
                    b.R(a, z);
                    b.c(f, function(d, a) {
                        if (i[a] && d) {
                            var e = (i[a] & 1) * c.p(q, k[a]) * d + (i[a] & 2) * c.p(l, k[a]) * d / 2;
                            b.Je[a](g, e)
                        }
                    });
                    b.kd(g, j.mb)
                }
            }

            function Yc() {
                var a = this;
                l.call(a, 0, 0, {
                    Wb: q
                });
                b.c(x, function(b) {
                    a.Oc(b);
                    b.ic(G / F)
                })
            }

            function Xc() {
                var a = this,
                    b = Jb.Q;
                l.call(a, -1, 2, {
                    fb: h.Ub,
                    xe: {
                        Ob: vc
                    },
                    Wb: q,
                    Vc: Cb
                }, b, {
                    Ob: 1
                }, {
                    Ob: -2
                })
            }

            function Zc() {
                var b = this;
                l.call(b, -1e8, 2e8);
                b.Ib = function(e, b) {
                    if (c.rb(b - e) > 1e-5) {
                        var g = b,
                            f = b;
                        if (c.X(b) != b && b > e && (C & 1 || b > bb)) f++;
                        var h = uc(f);
                        Ob(h, g, d);
                        a.j(j.qg, v(g), v(e), b, e)
                    }
                }
            }

            function Oc(o, n) {
                var b = this,
                    g, i, e, c, h;
                l.call(b, -1e8, 2e8, {
                    vd: 100
                });
                b.Yc = function() {
                    mb = d;
                    a.j(j.pg, v(z.n()), V.n())
                };
                b.Zc = function() {
                    mb = k;
                    c = k;
                    a.j(j.wg, v(z.n()), V.n());
                    !B && Pc()
                };
                b.Ib = function(f, b) {
                    var a = b;
                    if (c) a = h;
                    else if (e) {
                        var d = b / e;
                        a = m.bd(d) * (i - g) + g
                    }
                    a = Mc(a);
                    V.A(a)
                };
                b.Mc = function(a, c, h, f) {
                    B = k;
                    e = h || 1;
                    g = a;
                    i = c;
                    vb = d;
                    V.A(a);
                    vb = k;
                    b.A(0);
                    b.lc(e, f)
                };
                b.Fg = function() {
                    c = d;
                    c && b.xd(f, f, d)
                };
                b.Bg = function(a) {
                    h = a
                };
                V = new Zc;
                V.M(o);
                Nb && V.M(n)
            }

            function Lc() {
                var c = this,
                    a = Tb();
                b.J(a, 0);
                c.Q = a;
                c.fc = function() {
                    b.Mb(a);
                    b.Tb(a)
                }
            }

            function Wc(w, h) {
                var g = this,
                    ib = b.bb(g, o),
                    y, G = 0,
                    P, t, F, B, K, i, E = [],
                    V, N, R, n, r, A, S;
                l.call(g, -J, J + 1, {
                    Wb: C & 1 ? q : e,
                    Vc: Cb
                });

                function L() {
                    y && y.m();
                    Sb -= G;
                    G = 0;
                    y = new cb.Y(t, cb, {
                        Rb: b.l(t, "idle", ic),
                        Sf: !s
                    });
                    y.Uc(p.jc, Y)
                }

                function Z() {
                    y.ad < cb.ad && L()
                }

                function Y(b, a) {
                    G += a;
                    Sb += a;
                    if (h == u) !G && g.dc()
                }

                function Q(p, s, o) {
                    if (!N) {
                        N = d;
                        if (i && o) {
                            var q = b.l(i, "data-expand", 0) * 2,
                                f = o.width,
                                e = o.height,
                                m = f,
                                l = e;
                            if (f && e) {
                                if (B) {
                                    if (B & 3 && (!(B & 4) || f > I || e > H)) {
                                        var n = k,
                                            r = I / H * e / f;
                                        if (B & 1) n = r > 1;
                                        else if (B & 2) n = r < 1;
                                        m = n ? f * H / e : I;
                                        l = n ? H : e * I / f
                                    }
                                    b.G(i, m);
                                    b.B(i, l);
                                    b.R(i, (H - l) / 2);
                                    b.V(i, (I - m) / 2)
                                }
                                b.Ud(i, c.H((m + q) / m, (l + q) / l))
                            }
                            b.tb(i, "absolute")
                        }
                        a.j(j.Nf, h)
                    }
                    s.ce(k);
                    p && p(g)
                }

                function X(f, b, c, e) {
                    if (e == A && u == h && s && Db() && !g.Sc()) {
                        var a = v(f);
                        D.oe(a, h, b, g, c, H / I);
                        b.lg();
                        ob.ic(a - ob.hc() - 1);
                        ob.A(a);
                        ec(a, d)
                    }
                }

                function bb(b) {
                    if (b == A && u == h && Db() && !g.Sc()) {
                        if (!n) {
                            var a = f;
                            if (D)
                                if (D.Sb == h) a = D.Ke();
                                else D.fc();
                            Z();
                            n = new Vc(w, h, a, y);
                            n.Lf(r)
                        }!n.cd() && n.Qc()
                    }
                }

                function M(a, d, j) {
                    if (a == h) {
                        if (a != d) x[d] && x[d].ge();
                        else !j && n && n.mf();
                        r && r.Nc();
                        A = b.Qb();
                        g.ub(b.W(f, bb, A))
                    } else {
                        var i = c.v(h, a),
                            e = c.H(h, a),
                            l = c.v(e - i, i + q - e),
                            k = J + m.kf - 1;
                        (!R || l <= k) && g.ub()
                    }
                }

                function fb() {
                    if (u == h && n) {
                        n.z();
                        r && r.Mf();
                        r && r.hf();
                        n.yd()
                    }
                }

                function hb() {
                    u == h && n && n.z()
                }

                function ab(b) {
                    !db && a.j(j.gf, h, b)
                }
                g.ce = function(a) {
                    if (S != a) {
                        S = a;
                        a && b.ab(w, K);
                        !a && b.Nb(K)
                    }
                };
                g.ub = function(e, c) {
                    c = c || g;
                    if (E.length && !N) {
                        c.ce(d);
                        if (!V) {
                            V = d;
                            a.j(j.ff, h);
                            b.c(E, function(a) {
                                if (!b.k(a, "src")) {
                                    var c = b.P(a, "src") || b.P(a, "src2") || "";
                                    if (c) {
                                        a.src = c;
                                        b.nb(a, b.k(a, "data-display"))
                                    }
                                }
                            })
                        }
                        b.Be(E, i, b.W(f, Q, e, c))
                    } else Q(e, c)
                };
                g.ef = function() {
                    if (Rc())
                        if (q == 1) {
                            g.ge();
                            M(h, h)
                        } else {
                            var a;
                            if (D) a = D.ne(q);
                            if (a) {
                                A = b.Qb();
                                var c = h + eb,
                                    d = x[v(c)];
                                return d.ub(b.W(f, X, c, d, a, A), g)
                            } else(C || !pb(z.n()) || !pb(z.n() + eb)) && Rb(eb)
                        }
                };
                g.dc = function() {
                    M(h, h, d)
                };
                g.ge = function() {
                    r && r.Mf();
                    r && r.hf();
                    g.rd();
                    n && n.df();
                    n = f;
                    L()
                };
                g.lg = function() {
                    b.Mb(w)
                };
                g.rd = function() {
                    b.Lb(w)
                };

                function T(a, k, e) {
                    if (b.k(a, Kb)) return;
                    if (e) {
                        if (!t) {
                            t = a;
                            F = Tb(d);
                            var c = "background";
                            b.I(F, c + "Color", b.I(t, c + "Color"));
                            b.I(F, c + "Image", b.I(t, c + "Image"));
                            b.I(t, c, f);
                            b.ob(F, t)
                        }
                        b.k(a, "data-events", b.mc(a));
                        b.k(a, "data-display", b.nb(a));
                        b.zg(a, b.P(a, "data-to"));
                        b.Ag(a, b.P(a, "data-bf"));
                        e > 1 && b.Yb(a, b.k(a, "data-ts"));
                        b.Cg(a, b.l(a, "data-p"));
                        b.Dg(a, b.P(a, "po"));
                        if (a.tagName == "IMG") {
                            E.push(a);
                            if (!b.k(a, "src")) {
                                R = d;
                                b.Mb(a)
                            }
                        }
                        var g = b.Ie(a);
                        if (g) {
                            var h = new Image;
                            b.k(h, "src", g);
                            E.push(h)
                        }
                        e && b.J(a, (b.J(a) || 0) + 1)
                    }
                    var j = b.yb(a);
                    b.c(j, function(c) {
                        if (e < 3 && !i)
                            if (b.P(c, "u") == "image") {
                                i = c;
                                i.border = 0;
                                b.db(i, gb);
                                b.db(a, gb);
                                b.I(i, "maxWidth", "10000px");
                                b.ab(F, i)
                            } T(c, k, e + 1)
                    })
                }
                g.Xc = function(c, b) {
                    var a = J - b;
                    vc(P, a)
                };
                g.Sb = h;
                T(w, d, 0);
                B = b.l(t, "data-fillmode", m.bf);
                var O = b.ae(t, "thumb", d);
                if (O) {
                    b.kc(O);
                    b.Mb(O)
                }
                b.Lb(w);
                K = b.kc(U);
                b.J(K, 1e3);
                g.a(w, "click", ab);
                L(d);
                P = w;
                g.a(a, 203, M);
                g.a(a, 28, hb);
                g.a(a, 24, fb);
                g.m = function() {
                    b.m(ib, y, n)
                }
            }

            function Vc(F, h, q, r) {
                var c = this,
                    E = b.bb(c, o),
                    i = 0,
                    t = 0,
                    g, m, f, e, n, w, v, y = x[h];
                l.call(c, 0, 0);

                function A() {
                    c.Qc()
                }

                function C(a) {
                    v = a;
                    c.z();
                    c.Qc()
                }

                function z() {}
                c.Qc = function() {
                    if (!B && !mb && !v && u == h && !c.Sc()) {
                        var k = c.n();
                        if (!k)
                            if (g && !n) {
                                n = d;
                                c.yd(d);
                                a.j(j.af, h, t, i, t, g, e)
                            } a.j(j.od, h, k, i, m, f, e);
                        if (!Eb()) {
                            var l;
                            if (k == e) s && b.ac(y.ef, 20);
                            else {
                                if (k == f) l = e;
                                else if (!k) l = f;
                                else l = c.Cd();
                                (k != f || !Bc()) && c.lc(l, A)
                            }
                        }
                    }
                };
                c.mf = function() {
                    f == e && f == c.n() && c.A(m)
                };
                c.df = function() {
                    D && D.Sb == h && D.fc();
                    var b = c.n();
                    b < e && a.j(j.od, h, -b - 1, i, m, f, e)
                };
                c.yd = function(a) {
                    q && b.Pc(S, a && q.rc.Lg ? "" : "hidden")
                };
                c.Xc = function(c, b) {
                    if (n && b >= g) {
                        n = k;
                        y.rd();
                        D.fc();
                        a.j(j.Ze, h, g, i, t, g, e)
                    }
                    a.j(j.Ye, h, b, i, m, f, e)
                };
                c.Lf = function(a) {
                    if (a && !w) {
                        w = a;
                        a.Uc($JssorPlayer$.se, C)
                    }
                };
                c.a(r, p.wc, z);
                q && c.Oc(q);
                g = c.eb();
                c.Oc(r);
                m = g + r.oc;
                e = c.eb();
                f = s ? g + r.Ec : e;
                c.m = function() {
                    E.m();
                    c.z()
                }
            }

            function gc() {
                bc = mb;
                Ac = y.Cd();
                ab = z.n();
                ub = dd(ab)
            }

            function Fc() {
                gc();
                if (B || Eb()) {
                    y.z();
                    a.j(j.Xe)
                }
            }

            function Dc(f) {
                if (Db()) {
                    var b = z.n(),
                        a = ub,
                        e = 0;
                    if (f && c.rb(O) >= m.de) {
                        a = b;
                        e = yb
                    }
                    a = c.qb(a);
                    a = wb(a + e, .5);
                    var d = c.rb(a - b);
                    if (d < 1 && m.bd != h.Ub) d = c.p(d, .5);
                    if ((!db || !f) && bc) y.lc(Ac);
                    else if (b == a) jc.dc();
                    else y.Mc(b, a, d * Bb)
                }
            }

            function yc(a) {
                !b.cb(b.Gb(a), e, n.Od) && b.Bb(a)
            }

            function pc(b) {
                Ab = k;
                B = d;
                Fc();
                if (!bc) A = 0;
                a.j(j.We, v(ab), ab, b)
            }

            function Tc(a) {
                tc(a, 1)
            }

            function tc(c, d) {
                O = 0;
                xb = 0;
                yb = 0;
                Gc = hc;
                if (d) {
                    var h = c.touches[0];
                    zb = {
                        x: h.clientX,
                        y: h.clientY
                    }
                } else zb = b.Rc(c);
                var f = b.Gb(c),
                    g = b.cb(f, "1", Cc);
                if ((!g || g === t) && !W && (!d || c.touches.length == 1)) {
                    jb = b.cb(f, e, n.Od) || !ib || !Uc();
                    a.a(i, d ? "touchmove" : "mousemove", Wb);
                    Ab = !jb && b.cb(f, e, n.sc);
                    !Ab && !jb && pc(c, d)
                }
            }

            function Wb(a) {
                var e, f;
                a = b.sg(a);
                if (a.type != "mousemove")
                    if (a.touches.length == 1) {
                        f = a.touches[0];
                        e = {
                            x: f.clientX,
                            y: f.clientY
                        }
                    } else fb();
                else e = b.Rc(a);
                if (e) {
                    var i = e.x - zb.x,
                        j = e.y - zb.y,
                        g = c.rb(i),
                        h = c.rb(j);
                    if (A || g > 1.5 || h > 1.5)
                        if (Ab) pc(a, f);
                        else {
                            if (c.X(ub) != ub) A = A || R & W;
                            if ((i || j) && !A) {
                                if (W == 3)
                                    if (h > g) A = 2;
                                    else A = 1;
                                else A = W;
                                if (Qb && A == 1 && h > g * 2.4) jb = d
                            }
                            var l = i,
                                k = kb;
                            if (A == 2) {
                                l = j;
                                k = lb
                            }(O - xb) * nb < -1.5 && (yb = 0);
                            (O - xb) * nb > 1.5 && (yb = -1);
                            xb = O;
                            O = l;
                            Ic = ub - O * nb / k / Gc * m.Oe;
                            if (O && A && !jb) {
                                b.Bb(a);
                                y.Fg(d);
                                y.Bg(Ic)
                            }
                        }
                }
            }

            function fb() {
                Qc();
                a.K(i, "mousemove", Wb);
                a.K(i, "touchmove", Wb);
                db = O;
                if (B) {
                    db && s & 8 && (s = 0);
                    y.z();
                    B = k;
                    var b = z.n();
                    a.j(j.Ue, v(b), b, v(ab), ab);
                    X & 12 && gc();
                    Dc(d)
                }
            }

            function ed(c) {
                var f = b.Gb(c),
                    a = b.cb(f, "1", Kb);
                if (t === a)
                    if (db) {
                        b.mg(c);
                        a = b.cb(f, e, "data-jssor-button", "A");
                        a && b.Bb(c)
                    } else {
                        s & 4 && (s = 0);
                        a = b.cb(f, e, "data-jssor-click");
                        if (a) {
                            b.Bb(c);
                            hitValues = (b.k(a, "data-jssor-click") || "").split(":");
                            var g = b.ve(hitValues[1]);
                            hitValues[0] == "to" && qb(g - 1);
                            hitValues[0] == "next" && qb(g, e, d)
                        }
                    }
            }
            a.Ab = function(a) {
                if (a == e) return s;
                if (a != s) {
                    s = a;
                    s && x[u] && x[u].dc()
                }
            };
            a.xb = function() {
                return K
            };
            a.wb = function() {
                return P
            };
            a.Pe = function(b) {
                if (b == e) return Ub || K;
                a.Zb(b, b / K * P)
            };
            a.Zb = function(c, a, d) {
                b.G(t, c);
                b.B(t, a);
                zc = c / K;
                qc = a / P;
                b.c(cc, function(a) {
                    a.Zb(zc, qc, d)
                });
                if (!Ub) {
                    b.ob(S, w);
                    b.R(S, 0);
                    b.V(S, 0)
                }
                Ub = c
            };
            a.me = oc;
            a.pe = mc;
            a.xd = function() {
                a.Ab(s || 1)
            };

            function Sc() {
                Xb.je && b.I(w, Xb.je, ([f, "pan-y", "pan-x", "auto"])[ib] || "");
                a.a(t, "click", ed, d);
                a.a(t, "mouseleave", cd);
                a.a(t, "mouseenter", bd);
                a.a(t, "mousedown", tc);
                a.a(t, "touchstart", Tc);
                a.a(t, "dragstart", yc);
                a.a(t, "selectstart", yc);
                a.a(g, "mouseup", fb);
                a.a(i, "mouseup", fb);
                a.a(i, "touchend", fb);
                a.a(i, "touchcancel", fb);
                a.a(g, "blur", fb);
                m.Xb && a.a(i, "keydown", function(c) {
                    var a = b.Md(c);
                    if (a == 37 || a == 39) {
                        s & 8 && (s = 0);
                        wc(m.Xb * (a - 38) * nb, d)
                    }
                })
            }

            function kc(g) {
                xc.sd();
                E = [];
                x = [];
                var h = b.yb(w),
                    k = b.nd(["DIV", "A", "LI"]);
                b.c(h, function(a) {
                    var c = a;
                    if (k[a.tagName.toUpperCase()] && !b.P(a, "u") && b.nb(a) != "none") {
                        var c = Tb(d);
                        b.db(a, gb);
                        b.ob(c, a);
                        b.ab(c, a);
                        b.Yb(c, "flat");
                        b.Yb(a, "preserve-3d");
                        b.Mb(c);
                        E.push(c)
                    }
                    b.J(c, (b.J(c) || 0) + 1)
                });
                q = E.length;
                if (q) {
                    var a = R & 1 ? Gb : Fb;
                    Jc();
                    G = m.Se;
                    if (G == e) G = (a - F + L) / 2;
                    hb = a / F;
                    J = c.v(q, m.Bc || q, c.qb(hb));
                    C = J < q ? m.Pb : 0;
                    if (q * F - L <= a) {
                        hb = q - L / F;
                        G = (a - F + L) / 2;
                        ac = (a - F * q + L) / 2
                    }
                    if (Hb) {
                        Mb = Hb.Y;
                        Nb = !G && J == 1 && q > 1 && Mb && (!b.Xd() || b.gd() >= 9)
                    }
                    if (!(C & 1)) {
                        bb = G / F;
                        if (bb > q - 1) {
                            bb = q - 1;
                            G = bb * F
                        }
                        N = bb;
                        Q = N + q - hb - L / F
                    }
                    ib = (J > 1 || G ? R : -1) & m.Cc;
                    if (Nb) D = new Mb(Jb, I, H, Hb, Qb, Hc);
                    for (var f = 0; f < E.length; f++) {
                        var i = E[f],
                            j = new Wc(i, f);
                        x.push(j)
                    }
                    ob = new Xc;
                    z = new Yc;
                    y = new Oc(z, ob);
                    Sc()
                }
                b.c(Y, function(a) {
                    a.uc(q, x);
                    g && a.Uc(r.Gc, wc)
                })
            }
            a.q = function(c, g) {
                a.Q = t = b.Fb(c);
                K = b.G(t);
                P = b.B(t);
                m = b.gb({
                    bf: 0,
                    kf: 1,
                    Xb: 1,
                    Fc: 0,
                    Ab: 0,
                    Pb: 1,
                    Ed: d,
                    Rd: d,
                    tg: 1,
                    wd: 3e3,
                    he: 1,
                    Kc: 500,
                    bd: h.Vd,
                    de: 20,
                    Oe: 1,
                    ie: 0,
                    Pf: 1,
                    ee: 1,
                    Cc: 1
                }, g);
                m.Ed = m.Ed && b.og();
                if (m.Rb != e) m.wd = m.Rb;
                if (m.Qf != e) m.Bc = m.Qf;
                if (m.Rf != e) m.Se = m.Rf;
                s = m.Ab & 63;
                !m.Pf;
                eb = m.tg;
                X = m.he;
                X &= Qb ? 10 : 5;
                ic = m.wd;
                Bb = m.Kc;
                R = m.ee & 3;
                sb = b.fg(b.k(t, "dir")) == "rtl";
                Cb = sb && (R == 1 || m.Cc & 1);
                nb = Cb ? -1 : 1;
                Hb = m.Hg;
                cb = b.gb({
                    Y: p
                }, m.Tf);
                tb = m.bg;
                Z = m.dg;
                M = m.Ng;
                var f = b.yb(t);
                b.c(f, function(a, d) {
                    var c = b.P(a, "u");
                    if (c == "loading") U = a;
                    else {
                        if (c == "slides") {
                            w = a;
                            b.I(w, "margin", 0);
                            b.I(w, "padding", 0);
                            b.Yb(w, "flat")
                        }
                        if (c == "navigator") Vb = a;
                        if (c == "arrowleft") Zb = a;
                        if (c == "arrowright") Yb = a;
                        if (c == "thumbnavigator") Ib = a;
                        if (a.tagName != "STYLE" && a.tagName != "SCRIPT") cc[c || d] = new Nc(a, c == "slides", b.nd(["slides", "thumbnavigator"])[c])
                    }
                });
                U && b.Nb(U);
                U = U || b.Lc(i);
                Gb = b.G(w);
                Fb = b.B(w);
                I = m.Ae || Gb;
                H = m.we || Fb;
                gb = {
                    U: I,
                    S: H,
                    g: 0,
                    i: 0,
                    Ad: "block",
                    Ob: "absolute"
                };
                L = m.ie;
                kb = I + L;
                lb = H + L;
                F = R & 1 ? kb : lb;
                Jb = new Lc;
                b.k(t, Kb, "1");
                b.J(w, b.J(w) || 0);
                b.tb(w, "absolute");
                S = b.kc(w, d);
                b.I(S, "pointerEvents", "none");
                b.ob(S, w);
                b.ab(S, Jb.Q);
                b.Pc(w, "hidden");
                if (Vb && tb) {
                    tb.Vb = sb;
                    lc = new tb.Y(Vb, tb, K, P);
                    Y.push(lc)
                }
                if (Z && Zb && Yb) {
                    Z.Vb = sb;
                    Z.Pb = m.Pb;
                    nc = new Z.Y(Zb, Yb, Z, a);
                    Y.push(nc)
                }
                if (Ib && M) {
                    M.Fc = m.Fc;
                    M.Xb = M.Xb || 0;
                    M.Vb = sb;
                    dc = new M.Y(Ib, M, U);
                    !M.Gg && b.k(Ib, Cc, "1");
                    Y.push(dc)
                }
                kc(d);
                a.Zb(K, P);
                Pb();
                rb(v(m.Fc));
                b.I(t, "visibility", "visible")
            };
            a.m = function() {
                s = 0;
                b.m(x, Y, xc);
                b.Tb(t)
            };
            b.q(a)
        };
    j.gf = 21;
    j.We = 22;
    j.Ue = 23;
    j.pg = 24;
    j.wg = 25;
    j.ff = 26;
    j.Nf = 27;
    j.Xe = 28;
    j.Eg = 31;
    j.yg = 32;
    j.qg = 202;
    j.Of = 203;
    j.af = 206;
    j.Ze = 207;
    j.Ye = 208;
    j.od = 209;
    jssor_1_slider_init = function() {
        var d = [
                [{
                    b: -1,
                    d: 1,
                    o: -.7
                }],
                [{
                    b: 900,
                    d: 2e3,
                    x: -379,
                    e: {
                        x: 7
                    }
                }],
                [{
                    b: 900,
                    d: 2e3,
                    x: -379,
                    e: {
                        x: 7
                    }
                }],
                [{
                    b: -1,
                    d: 1,
                    o: -1,
                    sX: 2,
                    sY: 2
                }, {
                    b: 0,
                    d: 900,
                    x: -171,
                    y: -341,
                    o: 1,
                    sX: -2,
                    sY: -2,
                    e: {
                        x: 3,
                        y: 3,
                        sX: 3,
                        sY: 3
                    }
                }, {
                    b: 900,
                    d: 1600,
                    x: -283,
                    o: -1,
                    e: {
                        x: 16
                    }
                }]
            ],
            e = {
                Ab: 1,
                Kc: 800,
                bd: h.Pd,
                Tf: {
                    Y: s,
                    tc: d
                },
                dg: {
                    Y: v
                },
                bg: {
                    Y: u
                }
            },
            c = new j("jssor_1", e),
            f = 3e3;

        function a() {
            var d = c.Q.parentNode,
                b = d.clientWidth;
            if (b) {
                var e = m.min(f || b, b);
                c.Pe(e)
            } else g.setTimeout(a, 30)
        }
        a();
        b.jb(g, "load", a);
        b.jb(g, "resize", a);
        b.jb(g, "orientationchange", a)
    }
}(window, document, Math, null, true, false)