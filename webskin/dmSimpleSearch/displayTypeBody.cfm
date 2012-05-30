<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Simple Search Type Body --->
<!--- @@author: Justin Carter (justin@daemon.com.au) --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfparam name="url.q" default="">


<cfif len(url.q)>
	<!--- do search --->
	<cfset stLocal.qResults = search(url.q)>
<cfelse>
	<cfset stLocal.qResults = queryNew("objectid")>
	<cfoutput>
		<p>To perform a search, type some terms into the search box and press Enter.</p>
	</cfoutput>
</cfif>

<!--- no results --->
<cfif len(url.q) AND stLocal.qResults.recordCount eq 0>
	<cfoutput>
		<p>Your search for "#url.q#" returned 0 results.</p>
	</cfoutput>
</cfif>


<!--- display results --->
<cfloop query="stLocal.qResults">
	<skin:view objectid="#stLocal.qResults.objectid#" typename="#stLocal.qResults.typename#" webskin="displaySimpleSearchResult" q="#url.q#">
</cfloop>


<cfsetting enablecfoutputonly="false">