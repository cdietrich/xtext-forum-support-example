package org.xtext.example.mydsl.web

import com.google.inject.Inject
import javax.inject.Singleton
import org.eclipse.xtext.util.internal.Log
import org.eclipse.xtext.web.server.IServiceContext
import org.eclipse.xtext.web.server.InvalidRequestException
import org.eclipse.xtext.web.server.XtextServiceDispatcher
import org.eclipse.xtext.web.server.generator.GeneratorService

@Log
@Singleton
class MyDslXtextServiceDispatcher extends XtextServiceDispatcher{
	
	@Inject
  	private GeneratorService generatorService;
	
	override protected createServiceDescriptor(String serviceType, IServiceContext context) {
		if (serviceType == "generate-all") {
			return getGeneratorAllService(context)
		}
		super.createServiceDescriptor(serviceType, context)
	}
	
	protected def getGeneratorAllService(IServiceContext context)
			throws InvalidRequestException {
		val document = getDocumentAccess(context)
		new ServiceDescriptor => [
			service = [
				try {
					generatorService.getResult(document)
				} catch (Throwable throwable) {
					handleError(throwable)
				}
			]
		]
	}
	
}