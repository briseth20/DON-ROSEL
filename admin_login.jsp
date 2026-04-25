<form action="${pageContext.request.contextPath}/admin" method="POST">
    <input type="hidden" name="accion" value="login_admin">
    <div class="mb-3">
        <label>Correo Admin</label>
        <input type="email" name="txtemail" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Password Admin</label>
        <input type="password" name="txtpass" class="form-control" required>
    </div>
    <button type="submit" class="btn btn-dark w-100">INGRESAR AL SISTEMA</button>
</form>