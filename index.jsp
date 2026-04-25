<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Don Rosel - Café y Cacao de Origen</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        :root {
            --russet: #88471F;
            --soldier-green: #506039;
            --earth-yellow: #E29F61;
            --cookies-and-cream: #D9DCAF;
        }

        body {
            background-color: #F8F9F2;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* NAVBAR */
        .navbar-custom {
            background-color: var(--soldier-green);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        /* HERO */
        .hero-section {
            background:
                linear-gradient(rgba(0,0,0,.55), rgba(0,0,0,.55)),
                url('img/hero-coffee.jpg');
            background-size: cover;
            background-position: center;
            padding: 140px 0;
            color: white;
        }

        /* SECCIONES */
        .section-title {
            color: var(--soldier-green);
            font-weight: 800;
        }

        /* PRODUCTOS */
        .card-product {
            border: none;
            border-radius: 16px;
            transition: .3s;
            background: #fff;
        }

        .card-product:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(0,0,0,.12);
        }

        .price-tag {
            color: var(--russet);
            font-size: 1.4rem;
            font-weight: 800;
        }

        /* CONFIANZA */
        .trust-box {
            background-color: var(--cookies-and-cream);
            border-radius: 18px;
        }

        /* HISTORIA */
        .history-img {
            border-radius: 20px;
        }

        /* FOOTER */
        footer {
            background-color: var(--soldier-green);
            color: #fff;
        }

        footer a {
            color: var(--earth-yellow);
            text-decoration: none;
        }

        /* BOTÓN CARRITO */
        .sticky-cart {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 65px;
            height: 65px;
            background-color: var(--earth-yellow);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 8px 20px rgba(0,0,0,.3);
            color: white;
            z-index: 1000;
        }
    </style>
</head>
<body>
<c:if test="${empty productos}">
    <c:redirect url="home"/>
</c:if>

<!-- ================= NAVBAR ================= -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom sticky-top">
    <div class="container">

        <!-- LOGO -->
        <a class="navbar-brand" href="home">
            <img src="img/logo.jpg" alt="Don Rosel" style="height:48px;">
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <!-- MENU -->
            <ul class="navbar-nav mx-auto fw-semibold">
                <li class="nav-item"><a class="nav-link" href="home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="home#cafe">Café</a></li>
                <li class="nav-item"><a class="nav-link" href="home#cacao">Cacao</a></li>
                <li class="nav-item"><a class="nav-link" href="#nosotros">Nosotros</a></li>
            </ul>

            <!-- LOGIN / USUARIO -->
            <div class="navbar-nav align-items-center">

                <c:choose>
                    <c:when test="${not empty sessionScope.usuario}">
                      <div class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button">
                              <i class="bi bi-person-check-fill me-1"></i> ${sessionScope.usuario.nombre}
                          </a>
                          <ul class="dropdown-menu dropdown-menu-end shadow">
                              <li>
                                  <a class="dropdown-item" href="mis-pedidos">
                                      <i class="bi bi-bag-check me-2"></i> Mis pedidos
                                  </a>
                              </li>

                              <li>
                                  <a class="dropdown-item" href="ReservaServlet?action=mis-reservas">
                                      <i class="bi bi-star-fill me-2 text-warning"></i> Mis reservas
                                  </a>
                              </li>

                              <li><hr class="dropdown-divider"></li>

                              <li>
                                  <a class="dropdown-item text-danger" href="login?accion=salir">
                                      <i class="bi bi-box-arrow-right me-2"></i> Salir
                                  </a>
                              </li>
                          </ul>
                      </div>

                      <style>
                          /* Estilo opcional para resaltar el dropdown al pasar el mouse */
                          .dropdown-item:hover {
                              background-color: #f8f9fa;
                              color: #506039; /* El verde de Don Rosel */
                          }
                          .dropdown-item i {
                              width: 20px;
                              text-align: center;
                          }
                      </style>
                    </c:when>
                    <c:otherwise>
                        <a class="nav-link" href="login">
                            <i class="bi bi-person-circle"></i> Ingresar
                        </a>
                    </c:otherwise>
                </c:choose>

                <!-- CARRITO -->
                <a class="nav-link position-relative" href="carrito.jsp">
                    <i class="bi bi-cart3 fs-4"></i>
                    <c:if test="${not empty sessionScope.carrito}">
                        <span class="badge bg-danger position-absolute top-0 start-100 translate-middle">
                            ${sessionScope.carrito.size()}
                        </span>
                    </c:if>
                </a>
            </div>
        </div>
    </div>
</nav>

<!-- ================= HERO ================= -->
<header class="hero-section text-center">
    <div class="container">
        <h1 class="display-3 fw-bold">El auténtico sabor de

                                      Jaén-Cajamarca en cada grano</h1>
        <p class="lead fs-4">Café y cacao directo del productor peruano</p>
    </div>
</header>

<!-- ================= CONFIANZA ================= -->
<section class="container my-5">
    <div class="trust-box p-5 text-center">
        <h2 class="fw-bold">+500 personas</h2>
        <p class="fs-5">ya disfrutan de nuestro café artesanal cada día ☕</p>
    </div>
</section>

<!-- ================= PRODUCTOS ================= -->
<main class="container my-5">
    <h2 class="text-center mb-5 section-title">Nuestros Productos</h2>

    <section id="cafe" class="mb-5">
        <h3 class="section-title mb-4">Café</h3>
        <div class="row g-4">
            <c:forEach var="p" items="${productos}">
                <c:if test="${p.idCategoria == 1}">
                    <div class="col-md-6 col-lg-4">
                        <div class="card card-product h-100 shadow-sm border-0">
                            <c:if test="${p.tipo == 'EdicionLimitada'}">
                                <span class="position-absolute top-0 start-0 badge bg-warning text-dark m-3 shadow-sm" style="z-index: 10; font-weight: 800;">
                                    <i class="bi bi-star-fill me-1"></i> RESERVA ESPECIAL
                                </span>
                            </c:if>
                            <c:if test="${p.stock <= 0}">
                                <span class="position-absolute top-0 end-0 badge bg-secondary text-white m-3 shadow-sm" style="z-index: 10; font-weight: 800;">
                                    AGOTADO
                                </span>
                            </c:if>
                            <c:if test="${p.stock <= 0}">
                                <span class="position-absolute top-0 end-0 badge bg-secondary text-white m-3 shadow-sm" style="z-index: 10; font-weight: 800;">
                                    AGOTADO
                                </span>
                            </c:if>

                            <img src="img/productos/${p.imagen}.jpg" class="card-img-top" style="height:260px; object-fit:contain; background:#fff; border-top-left-radius: 16px; border-top-right-radius: 16px;">

                            <div class="card-body d-flex flex-column">
                                <h5 class="fw-bold">${p.nombre}</h5>
                                <p class="text-muted small flex-grow-1">${p.descripcion}</p>

                                <div class="mb-3">
                                    <span class="badge bg-light text-dark border">Tostado: ${p.tostado}</span>
                                    <span class="badge bg-light text-dark border">Peso: ${p.peso}</span>
                                </div>

                                <div class="d-flex justify-content-between align-items-center mt-auto">
                                    <span class="price-tag text-success fw-bold fs-4">S/ ${p.precio}</span>

                                    <c:choose>
                                        <%-- CASO 1: PRODUCTO DE RESERVA --%>
                                        <c:when test="${p.tipo == 'EdicionLimitada'}">
                                            <a href="ReservaServlet?action=solicitar&idProducto=${p.id}" class="btn fw-bold shadow-sm"
                                               style="background-color: #D4AF37; color: white;">
                                                <i class="bi bi-calendar-check me-1"></i> Reservar
                                            </a>
                                        </c:when>

                                        <%-- CASO 2: PRODUCTO REGULAR --%>
                                        <c:otherwise>
                                            <a href="home?accion=detalle&id=${p.id}" class="btn btn-dark shadow-sm ${p.stock <= 0 ? 'disabled' : ''}">
                                                <i class="bi bi-cart-plus me-1"></i> Comprar
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </section>

    <section id="cacao" class="mb-5">
        <h3 class="section-title mb-4">Cacao</h3>
        <div class="row g-4">
            <c:forEach var="p" items="${productos}">
                <c:if test="${p.idCategoria == 2}">
                    <div class="col-md-6 col-lg-4">
                        <div class="card card-product h-100 shadow-sm border-0">
                            <c:if test="${p.tipo == 'EdicionLimitada'}">
                                <span class="position-absolute top-0 start-0 badge bg-warning text-dark m-3 shadow-sm" style="z-index: 10; font-weight: 800;">
                                    <i class="bi bi-star-fill me-1"></i> RESERVA ESPECIAL
                                </span>
                            </c:if>

                            <img src="img/productos/${p.imagen}.jpg" class="card-img-top" style="height:260px; object-fit:contain; background:#fff; border-top-left-radius: 16px; border-top-right-radius: 16px;">

                            <div class="card-body d-flex flex-column">
                                <h5 class="fw-bold">${p.nombre}</h5>
                                <p class="text-muted small flex-grow-1">${p.descripcion}</p>

                                <div class="mb-3">
                                    <span class="badge bg-light text-dark border">Tostado: ${p.tostado}</span>
                                    <span class="badge bg-light text-dark border">Peso: ${p.peso}</span>
                                </div>

                                <div class="d-flex justify-content-between align-items-center mt-auto">
                                    <span class="price-tag text-success fw-bold fs-4">S/ ${p.precio}</span>

                                    <c:choose>
                                        <%-- CASO 1: PRODUCTO DE RESERVA --%>
                                        <c:when test="${p.tipo == 'EdicionLimitada'}">
                                            <a href="ReservaServlet?action=solicitar&idProducto=${p.id}" class="btn fw-bold shadow-sm"
                                               style="background-color: #D4AF37; color: white;">
                                                <i class="bi bi-calendar-check me-1"></i> Reservar
                                            </a>
                                        </c:when>

                                        <%-- CASO 2: PRODUCTO REGULAR --%>
                                        <c:otherwise>
                                            <a href="home?accion=detalle&id=${p.id}" class="btn btn-dark shadow-sm ${p.stock <= 0 ? 'disabled' : ''}">
                                                <i class="bi bi-cart-plus me-1"></i> Comprar
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </section>
</main>

<!-- ================= HISTORIA ================= -->
<section id="nosotros" class="container my-5">
    <div class="row align-items-center">
        <div class="col-md-6">
            <h2 class="section-title">Nuestra Historia</h2>
            <p>Don Rosel nace del amor por la tierra, el café y el cacao. Trabajamos
               directamente con agricultores peruanos para llevar calidad real a tu taza.</p>
        </div>
        <div class="col-md-6">
            <img src="img/historia.jpg" class="img-fluid history-img">
        </div>
    </div>
</section>

<!-- ================= FOOTER ================= -->
<style>
    .main-footer {
        background-color: var(--soldier-green); /* Color base */
        color: white;
        border-top: 5px solid var(--russet);
    }
    .footer-logo {
        height: 70px;
        background-color: white;
        padding: 5px;
        border-radius: 8px;
    }
    .social-link {
        width: 40px;
        height: 40px;
        background-color: white;
        color: var(--russet);
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        font-size: 1.2rem;
        transition: all 0.3s ease;
        text-decoration: none;
    }
    .social-link:hover {
        background-color: var(--earth-yellow);
        color: white;
        transform: translateY(-3px);
    }
    .contact-info p {
        margin-bottom: 8px;
        font-size: 0.95rem;
    }
</style>

<footer class="main-footer pt-5 pb-4">
    <div class="container">
        <div class="row align-items-center">

            <div class="col-md-4 mb-4 text-center text-md-start">
                <img src="img/logo.jpg" style="height:50px;">
                <p class="small opacity-75">Calidad que despierta tus sentidos desde el origen.</p>
            </div>

            <div class="col-md-4 mb-4 text-center contact-info">
                <h6 class="fw-bold text-uppercase mb-3" style="color: var(--earth-yellow);">Contacto</h6>
                <p><i class="bi bi-geo-alt-fill me-2"></i> Chiclayo, Lambayeque - Perú</p>
                <p><i class="bi bi-envelope-at-fill me-2"></i> contacto@donrosel.com</p>
                <p><i class="bi bi-whatsapp me-2"></i> +51 995 905 532</p>
            </div>

            <div class="col-md-4 mb-4 text-center text-md-end">
                <h6 class="fw-bold text-uppercase mb-3" style="color: var(--earth-yellow);">Contactanos</h6>
                <div class="d-flex justify-content-center justify-content-md-end gap-3">
                    <a href="https://www.tiktok.com/@don_rosel?is_from_webapp=1&sender_device=pc" target="_blank" class="social-link">
                        <i class="bi bi-tiktok"></i>
                    </a>
                    <a href="https://wa.me/51995905532" target="_blank" class="social-link">
                        <i class="bi bi-whatsapp"></i>
                    </a>
                </div>
            </div>

        </div>

        <hr class="mt-4 mb-3 opacity-25">
        <div class="text-center">
            <small class="opacity-50">&copy; 2026 Don Rosel. Todos los derechos reservados.</small>
        </div>
    </div>
</footer>

<!-- BOTÓN CARRITO -->
<a href="carrito.jsp" class="sticky-cart">
    <i class="bi bi-cart-fill fs-3"></i>
</a>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
