<cfcomponent extends="farcry.core.webtop.install.manifest" name="manifest">

	<!--- IMPORT TAG LIBRARIES --->
	<cfimport taglib="/farcry/core/packages/fourq/tags/" prefix="q4">
	
	
	<cfset this.name = "Fandango" />
	<cfset this.description = "The latest and greatest installation for FarCry 6.2." />
	<cfset this.lRequiredPlugins = "farcrycms" />
	<cfset addSupportedCore(majorVersion="6", minorVersion="2", patchVersion="0") />
		
	
	<cffunction name="install" output="true">
		
		<cfset var result = "DONE" />
		
		<cfset result = createContent(argumentCollection=arguments) />
				
		
		<cfreturn result />
	</cffunction>
	
		
	

</cfcomponent>

