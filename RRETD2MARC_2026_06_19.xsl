<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    xmlns:marc="http://www.loc.gov/MARC21/slim"
    exclude-result-prefixes="xs math oai"
    version="3.0">
    
    <xsl:output method="xml" indent="true" encoding="UTF-8"/>
    
    <xsl:template match="/" expand-text="yes">
        <marc:collection>
            <xsl:for-each select="//oai:record/oai:metadata/oai:document-export/oai:documents/oai:document">
                <xsl:variable name="currentDate" select="format-date(current-date(), '[Y01][M01][D01]')"/>
                <xsl:variable name="pubDate" select="substring(./oai:publication-date, 1, 4)"/>
                <xsl:variable name="campusMonth" select="substring(./oai:publication, 5, 7)"/>
                <xsl:variable name="lang" select="'eng'"/>
                <marc:record>
                    <!-- leader -->
                    <marc:leader>00000nam a22000003u 4500</marc:leader>
                    
                    <!-- 008 -->
                    <marc:controlfield tag="008">
                        <!-- 00-05 -->
                        <xsl:text>{$currentDate}</xsl:text>
                        <!--06-14 -->
                        <xsl:choose>
                            <xsl:when test="$pubDate != ''">
                                <xsl:text>s{$pubDate}    </xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>nuuuuuuuu</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- 15-17 -->
                        <xsl:text>wvu</xsl:text>
                        <!-- 18-39 -->
                        <xsl:text>     om    000 u und d</xsl:text>
                    </marc:controlfield>
                    
                    <marc:controlfield tag="006">
                        <xsl:text>m     o  d        </xsl:text>
                    </marc:controlfield>
                    
                    <marc:controlfield tag="007">
                        <xsl:text>cr||||||||||||</xsl:text>
                    </marc:controlfield>
                 
                    <!-- 040 -->
                    <marc:datafield tag="040" ind1=" " ind2=" ">
                        <marc:subfield code="a">WVU</marc:subfield>
                        <marc:subfield code="b">eng</marc:subfield>
                        <marc:subfield code="c">WVU</marc:subfield>
                    </marc:datafield>
                    
                    <!-- 100 -->
                    <xsl:call-template name="f100"/>
                    
                    <!-- 245 -->
                    <xsl:call-template name="f245"/>
                    
                    <!-- 264 -->
                    <marc:datafield tag="264" ind1=" " ind2="1">
                        <marc:subfield code="a">
                            <xsl:text>Morgantown, West Virginia :</xsl:text>
                        </marc:subfield>
                        <marc:subfield code="b">
                            <xsl:text>West Virginia University,</xsl:text>
                        </marc:subfield>
                        <marc:subfield code="c">
                            <xsl:text>{$pubDate}.</xsl:text>
                        </marc:subfield>
                    </marc:datafield>
                    
                    <!-- 300 -->
                    <marc:datafield tag="300" ind1=" " ind2=" ">
                        <marc:subfield code="a">
                            <xsl:text>1 online resource</xsl:text>
                        </marc:subfield>
                    </marc:datafield>
                    
                    <!-- 3XX -->
                    <marc:datafield tag="336" ind1=" " ind2=" ">
                        <marc:subfield code="a">
                            <xsl:text>text</xsl:text>
                        </marc:subfield>
                        <marc:subfield code="b">
                            <xsl:text>txt</xsl:text>
                        </marc:subfield>
                        <marc:subfield code="2">
                            <xsl:text>rdacontent</xsl:text>
                        </marc:subfield>
                    </marc:datafield>
                    
                    <marc:datafield tag="337" ind1=" " ind2=" ">
                        <marc:subfield code="a">
                            <xsl:text>computer</xsl:text>
                        </marc:subfield>
                        <marc:subfield code="b">
                            <xsl:text>c</xsl:text>
                        </marc:subfield>
                        <marc:subfield code="2">
                            <xsl:text>rdamedia</xsl:text>
                        </marc:subfield>
                    </marc:datafield>
                    
                    <marc:datafield tag="338" ind1=" " ind2=" ">
                        <marc:subfield code="a">
                            <xsl:text>online resource</xsl:text>
                        </marc:subfield>
                        <marc:subfield code="b">
                            <xsl:text>cr</xsl:text>
                        </marc:subfield>
                        <marc:subfield code="2">
                            <xsl:text>rdacarrier</xsl:text>
                        </marc:subfield>
                    </marc:datafield>
                    
                    <marc:datafield tag="347" ind1=" " ind2=" ">
                        <marc:subfield code="a">
                            <xsl:text>text file</xsl:text>
                        </marc:subfield>
                        <marc:subfield code="2">
                            <xsl:text>rdaft</xsl:text>
                        </marc:subfield>
                    </marc:datafield>
                    
                    <marc:datafield tag="347" ind1=" " ind2=" ">
                        <marc:subfield code="b">
                            <xsl:text>PDF</xsl:text>
                        </marc:subfield>
                    </marc:datafield>
                    
                    <!-- 5XX -->
                    <xsl:call-template name="f502"/>
                    <xsl:call-template name="f506"/>
                    <xsl:call-template name="f520"/>
                    
                    <!-- 588 -->
                    <marc:datafield tag="588" ind1=" " ind2=" ">
                        <marc:subfield code="a">Machine-generated record</marc:subfield>
                    </marc:datafield>
                    
                    <!-- 6XXs -->
                    <xsl:call-template name="f653"/>
                    
                    <marc:datafield tag="655" ind1=" " ind2="7">
                        <marc:subfield code="a">Academic theses.</marc:subfield>
                        <marc:subfield code="2">lcgft</marc:subfield>
                    </marc:datafield>
                    
                    <!-- 7XXs -->
                    <xsl:call-template name="f700"/>
                    <xsl:call-template name="f710"/>
                    
                    <!-- 856 -->
                    <xsl:call-template name="f856"/>
                    
                </marc:record>
            </xsl:for-each>
        </marc:collection>
    </xsl:template>
    
    <xsl:template name="f100" expand-text="true">
        <xsl:if test="oai:authors/oai:author">
            <xsl:variable name="author1" select="oai:authors/oai:author[1]"/>
            <marc:datafield tag="100" ind1="1" ind2=" ">
                <marc:subfield code="a">
                    <xsl:value-of select="upper-case(substring($author1/oai:lname, 1, 1))||substring($author1/oai:lname, 2, string-length($author1/oai:lname)-1)
                        ||', '||upper-case(substring($author1/oai:fname, 1, 1))||substring($author1/oai:fname, 2, string-length($author1/oai:fname)-1)"/>
                    <xsl:if test="$author1/oai:mname">
                        <xsl:choose>
                            <xsl:when test="ends-with($author1/oai:mname, '.') or string-length($author1/oai:mname) gt 1">
                                <xsl:value-of select="' '||$author1/oai:mname"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="' '||$author1/oai:mname||'.'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <xsl:text>,</xsl:text>
                </marc:subfield>
                <marc:subfield code="e">
                    <xsl:text>author.</xsl:text>
                </marc:subfield>
                <xsl:if test="oai:fields/oai:field[@name = 'orcid']">
                    <xsl:variable name="orcidID" select="oai:fields/oai:field[@name = 'orcid']"/>
                    <xsl:variable name="sub1">
                        <xsl:analyze-string select="$orcidID" regex="https://orcid.org/\d\d\d\d-\d\d\d\d-\d\d\d\d-\d\d\d\d">
                            <xsl:matching-substring>
                                <marc:subfield code="1">
                                    <xsl:value-of select="."/>
                                </marc:subfield>
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                    </xsl:variable>
                    <xsl:if test="$sub1/marc:subfield">
                        <xsl:copy-of select="$sub1/marc:subfield[1]"/>
                    </xsl:if>
                </xsl:if>
            </marc:datafield>   
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="f245">
        <xsl:variable name="title" select="oai:title"/>
        <marc:datafield tag="245">
            <!-- ind1 -->
            <xsl:choose>
                <xsl:when test="oai:authors/oai:author">
                    <xsl:attribute name="ind1" select="'1'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="ind1" select="'0'"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- ind2 -->
            <xsl:choose>
                <xsl:when test="matches(lower-case($title), '^a ')">
                    <xsl:attribute name="ind2" select="'2'"/>
                </xsl:when>
                <xsl:when test="matches(lower-case($title), '^an ')">
                    <xsl:attribute name="ind2" select="'3'"/>
                </xsl:when>
                <xsl:when test="matches(lower-case($title), '^the ')">
                    <xsl:attribute name="ind2" select="'4'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="ind2" select="'0'"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- subfield $a -->
            <marc:subfield code="a">
                <xsl:choose>
                    <xsl:when test="contains($title, ':')">
                        <xsl:value-of select="normalize-space(substring-before($title, ':'))"/>
                        <xsl:value-of select="' :'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$title"/>
                        <xsl:if test="not(matches($title, '[!?.]$'))">
                            <xsl:value-of select="'.'"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </marc:subfield>
            <xsl:if test="contains($title, ':')">
                <marc:subfield code="b">
                    <xsl:value-of select="normalize-space(substring-after($title, ':'))"/>
                    <xsl:if test="not(matches($title, '[!?.]$'))">
                        <xsl:value-of select="'.'"/>
                    </xsl:if>
                </marc:subfield>
            </xsl:if>
        </marc:datafield>
    </xsl:template>
    
    <xsl:template name="f502" expand-text="yes">
        <xsl:variable name="degreeName" select="oai:fields/oai:field[@name = 'degree_name']/oai:value"/>
        <marc:datafield tag="502" ind1=" " ind2=" ">
            <xsl:choose>
                <xsl:when test="matches($degreeName, 'PhD')">
                    <marc:subfield code="b">
                        <xsl:text>Ph. D.</xsl:text>
                    </marc:subfield>
                </xsl:when>
                <xsl:when test="matches($degreeName, 'EdD')">
                    <marc:subfield code="b">
                        <xsl:text>Ed. D.</xsl:text>
                    </marc:subfield>
                </xsl:when>
                <xsl:when test="matches($degreeName, 'DBA')">
                    <marc:subfield code="b">
                        <xsl:text>D.B.A.</xsl:text>
                    </marc:subfield>
                </xsl:when>
                <xsl:when test="matches($degreeName, 'DMA')">
                    <marc:subfield code="b">
                        <xsl:text>D.M.A.</xsl:text>
                    </marc:subfield>
                </xsl:when>
                <xsl:when test="matches($degreeName, 'DNP')">
                    <marc:subfield code="b">
                        <xsl:text>D.N.P.</xsl:text>
                    </marc:subfield>
                </xsl:when>
                <xsl:when test="matches($degreeName, 'MS')">
                    <marc:subfield code="b">
                        <xsl:text>M.S.</xsl:text>
                    </marc:subfield>
                </xsl:when>
                <xsl:when test="matches($degreeName, 'MM')">
                    <marc:subfield code="b">
                        <xsl:text>M.M.</xsl:text>
                    </marc:subfield>
                </xsl:when>
                <xsl:when test="matches($degreeName, 'MA')">
                    <marc:subfield code="b">
                        <xsl:text>M.A.</xsl:text>
                    </marc:subfield>
                </xsl:when>
                <xsl:when test="matches($degreeName, 'MLA')">
                    <marc:subfield code="b">
                        <xsl:text>M.L.A.</xsl:text>
                    </marc:subfield>
                </xsl:when>
                <xsl:when test="matches($degreeName, 'MFA')">
                    <marc:subfield code="b">
                        <xsl:text>M.F.A.</xsl:text>
                    </marc:subfield>
                </xsl:when>
                <xsl:when test="matches($degreeName, 'OTD')">
                    <marc:subfield code="b">
                        <xsl:text>O.T.D.</xsl:text>
                    </marc:subfield>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message>ERROR: Degree missing or not recognized for {oai:coverpage-url}. No 502 $b added to record.</xsl:message>
                </xsl:otherwise>
            </xsl:choose>
            <marc:subfield code="c">
                <xsl:text>West Virginia University</xsl:text>
            </marc:subfield>
            <marc:subfield code="d">
                <xsl:value-of select="substring(./oai:publication-date, 1, 4)||'.'"/>
            </marc:subfield>
        </marc:datafield>
    </xsl:template>
    
    <xsl:template name="f506" expand-text="yes">
        <xsl:variable name="campusYear" select="substring(./oai:publication-date, 1, 4)"/>
        <xsl:variable name="campusMonth" select="substring(./oai:publication-date, 6, 2)"/>
        <xsl:choose>
            <xsl:when test="contains(oai:document-type, 'campus')">
                <marc:datafield tag="506" ind1="1" ind2=" ">
                    <marc:subfield code="a">WVU campus access only until {concat(string(number($campusYear)+2), '-', $campusMonth)}.</marc:subfield>
                </marc:datafield>
            </xsl:when>
            <xsl:otherwise>
                <marc:datafield tag="506" ind1="0" ind2=" ">
                    <marc:subfield code="f">Unrestricted online access</marc:subfield>
                    <marc:subfield code="2">star</marc:subfield>
                </marc:datafield>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="f520">
        <xsl:if test="oai:abstract">
            <xsl:variable name="abstract_nohtml" select="replace(oai:abstract, '&lt;p&gt;', '') => replace('&lt;/p&gt;', '') 
                => replace('&lt;em&gt;', '') => replace('&lt;/em&gt;', '') 
                => replace ('&lt;strong&gt;', '') => replace('&lt;/strong&gt;', '')"/>
            <marc:datafield tag="520" ind1="3" ind2=" ">
                <marc:subfield code="a">
                    <xsl:value-of select="$abstract_nohtml"/>
                </marc:subfield>
            </marc:datafield>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="f653">
        <xsl:for-each select="oai:keywords/oai:keyword">
            <marc:datafield tag="653" ind1="0" ind2=" ">
                <marc:subfield code="a">
                    <xsl:value-of select="."/>
                </marc:subfield>
            </marc:datafield>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="f700">
        <xsl:if test="count(oai:author/oai:authors) gt 1">
            <xsl:for-each select="oai:author/oai:authors">
                <xsl:if test="position() != 1">
                    <marc:datafield tag="700" ind1="1" ind2=" ">
                        <marc:subfield code="a">
                            <xsl:value-of select="./oai:lname||', '||./oai:fname"/>
                            <xsl:if test="./oai:mname">
                                <xsl:value-of select="' '||./oai:mname"/>
                            </xsl:if>
                            <xsl:text>,</xsl:text>
                        </marc:subfield>
                        <marc:subfield code="e">
                            <xsl:text>author.</xsl:text>
                        </marc:subfield>
                    </marc:datafield>   
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="f710">
        <marc:datafield tag="710" ind1="2" ind2=" ">
            <marc:subfield code="a">
                <xsl:text>West Virginia University,</xsl:text>
            </marc:subfield>
            <marc:subfield code="e">
                <xsl:text>degree granting institution.</xsl:text>
            </marc:subfield>
            <marc:subfield code="1">
                <xsl:text>https://id.oclc.org/worldcat/entity/E39QH7JmmYvdF7Y7mDDXCmV4Y6</xsl:text>
            </marc:subfield>
        </marc:datafield>
    </xsl:template>

    <xsl:template name="f856" expand-text="yes">
        <xsl:choose>
            <xsl:when test="oai:fields/oai:field[matches(@name, 'doi')]">
                <marc:datafield tag="856" ind1="4" ind2="0">
                    <marc:subfield code="u">
                        <xsl:value-of select="oai:fields/oai:field[matches(@name, 'doi')]/oai:value"/>
                    </marc:subfield>
                </marc:datafield>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>ERROR: no doi found for {oai:coverpage-url}. No 856 added to record.</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="text()"/>
</xsl:stylesheet>