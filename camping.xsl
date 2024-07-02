<?xml version="1.0" encoding="UTF-8"?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 5
   Case Problem 4

   Cairn Camping Store XSLT Style Sheet
   Author: Samantha Hamilton
   Date:   6-29-24

   Filename:         camping.xsl
   Supporting Files: 
-->
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"
        doctype-system="about:legacy-compat"
        encoding="UTF-8"
        indent="yes" />

    <xsl:template match="/customers">
        <html>
            <head>
                <title>Customer Orders</title>
                <link rel="stylesheet" type="text/css" href="./style.css" />
            </head>

            <body>
                <header>
                    <h1>Cairn Camping Store</h1>
                    <h2>Customer Orders</h2>
                </header>
                <section>
                    <xsl:apply-templates select="customer">
                        <xsl:sort select="name" />
                    </xsl:apply-templates>
                </section>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="customer">
        <table class="cinfo" >
            <tr>
                <th align="left">Name</th>
                <td>
                    <xsl:value-of select="name" />
                </td>
            </tr>
            <tr>
                <th align="left">Address</th>
                <td>
                    <xsl:value-of select="street" />
                </td>
                <td>
                    <xsl:value-of select="city" />
                </td>
                <td>
                    <xsl:value-of select="state" />
                </td>
                <td>
                    <xsl:value-of select="zip" />
                </td>
            </tr>
            <tr>
                <th align="left">Customer ID</th>
                <td>
                    <xsl:value-of select="@cid" />
                </td>
            </tr>
        </table>
        <xsl:apply-templates
            select="orders">
            <xsl:sort select="@oid"
                order="descending" />
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="orders/order">
        <table>
            <thead>
                <tr class="order-header">
                    <td>
                            <xsl:value-of select="date" />
                    </td>
                    <td></td>
                    <td align="right">
                        <xsl:value-of select="@oid" />
                    </td>
                </tr>
                </thead>
                <thead class="item-header">
                    <th align="left">Item No.</th>
                    <th align="left">Description</th>
                    <th align="left">Qty</th>
                </thead>
                <tbody>
                <xsl:for-each select="item">
                    <xsl:sort select="qty" order="descending" />
                    <xsl:sort select="@iid" />
                    <tr>
                        <td>
                            <xsl:value-of select="@iid" />
                        </td>
                        <td>
                            <xsl:value-of select="description" />
                        </td>
                        <td>
                            <xsl:value-of select="qty" />
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>

    </xsl:template>
    <xsl:template match="@name|@street|@city|@state|@zip|@customer/cid">
        <td>
            <xsl:value-of select="." />
        </td>
    </xsl:template>

</xsl:stylesheet>