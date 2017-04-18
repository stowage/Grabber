<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xhtml="http://www.w3.org/1999/xhtml" version="1.0">
<xsl:output method="text" indent="yes"/>
<xsl:param name="ticker"/>
<xsl:template match="xhtml:html">
INSERT INTO EURODIV VALUES('<xsl:value-of select="$ticker"/>','<xsl:value-of select="//xhtml:tr[contains(xhtml:td, 'Dividend:')]/xhtml:td[position()=2]/xhtml:strong/text()"/>','<xsl:value-of select="//xhtml:tr[contains(xhtml:td, 'Yield')]/xhtml:td[position()=2]/xhtml:strong/text()"/>');
</xsl:template>
<xsl:template match="*">
<xsl:apply-templates select="xhtml:html"/>
</xsl:template>
</xsl:stylesheet>