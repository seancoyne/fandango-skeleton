<cfcomponent displayname="Simple Search" extends="farcry.core.packages.forms.forms"
	fualias="search" hint="A simple search which does a SQL LIKE filter on dmHTML content.">


	<cffunction name="search" returntype="query">
		<cfargument name="q" type="string" default="">

		<cfset var qResults = "">

		<cfquery name="qResults" datasource="#application.dsn#">
			SELECT objectid, typename, SUM(relevance) AS relevance
			FROM (
				SELECT objectid, 'dmHTML' AS typename, 10 AS relevance FROM dmHTML WHERE title LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#arguments.q#%">
				UNION
				SELECT objectid, 'dmHTML' AS typename, 7 AS relevance FROM dmHTML WHERE teaser LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#arguments.q#%">
				UNION
				SELECT objectid, 'dmHTML' AS typename, 5 AS relevance FROM dmHTML WHERE body LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#arguments.q#%">
			) results
			GROUP BY objectid, typename
			ORDER BY relevance DESC
		</cfquery>

		<cfreturn qResults>
	</cffunction>

</cfcomponent>