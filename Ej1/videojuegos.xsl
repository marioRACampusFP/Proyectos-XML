<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <head>
      <title>Inventario de Videojuegos</title>
      <style>
        body {font-family: Arial; background: #f0f0f0; padding: 20px;}
        table {width: 100%; border-collapse: collapse; margin: 20px 0;}
        th, td {border: 1px solid #ccc; padding: 10px; text-align: center;}
        th {background: #2c3e50; color: white;}
        img {width: 100px; height: auto; border-radius: 8px; object-fit: cover;} /* Ajuste para que no se distorsione */
        .descuento {color: green; font-weight: bold;}
      </style>
    </head>
    <body>
      <h1>Inventario de Videojuegos</h1>
      <table>
        <tr>
          <th>Nombre</th>
          <th>Plataforma</th>
          <th>Género</th>
          <th>Desarrollador</th>
          <th>Precio</th>
          <th>Precio con 10% descuento</th>
          <th>Carátula</th>
        </tr>

        <xsl:for-each select="inventario/videojuego">
          <tr>
            <td><xsl:value-of select="@nombre"/></td>
            <td><xsl:value-of select="@plataforma"/></td>
            <td><xsl:value-of select="genero"/></td>
            <td><xsl:value-of select="desarrollador"/></td>
            <td><xsl:value-of select="precio"/> €</td>
            <td class="descuento">
              <xsl:value-of select="format-number(precio - (precio * 0.1), '#.00')"/> €
            </td>
            <td>
              <img src="{imagen}" alt="{@nombre}"/>
            </td>
          </tr>
        </xsl:for-each>
      </table>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>