<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xhtml="http://www.w3.org/1999/xhtml" version="1.0">
<xsl:output method="text" indent="yes"/>
<xsl:param name="ticker"/>
<xsl:template match="xhtml:html">
INSERT INTO EURODIV VALUES('<xsl:value-of select="$ticker"/>','<xsl:value-of select="substring-before(//xhtml:div[xhtml:label/text()='Div &amp; Yield']/xhtml:span/text(), ' ')"/><xsl:if test="not(substring-before(//xhtml:div[xhtml:label/text()='Div &amp; Yield']/xhtml:span/text(), ' '))">0</xsl:if>','<xsl:value-of select="//xhtml:div[xhtml:label/text()='Ex Div Date']/xhtml:span/text()"/>');
</xsl:template>
<xsl:template match="*">
<xsl:apply-templates select="xhtml:html"/>
</xsl:template>
</xsl:stylesheet>