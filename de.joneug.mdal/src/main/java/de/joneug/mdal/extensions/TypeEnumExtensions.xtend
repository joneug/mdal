package de.joneug.mdal.extensions

import de.joneug.mdal.generator.GeneratorManagement
import de.joneug.mdal.mdal.CustomField
import de.joneug.mdal.mdal.TypeEnum

import static extension de.joneug.mdal.extensions.CustomFieldExtensions.*
import static extension de.joneug.mdal.extensions.EObjectExtensions.*
import static extension de.joneug.mdal.extensions.StringExtensions.*

class TypeEnumExtensions {
	
	static GeneratorManagement management = GeneratorManagement.getInstance()
	
	static def void doGenerate(TypeEnum typeEnum) {
		typeEnum.solution.saveEnum(typeEnum.getContainerOfType(CustomField).enumFileName, typeEnum.doGenerateEnum)
	}
	
	static def doGenerateEnum(TypeEnum typeEnum) '''
	enum «management.newEnumNo» «typeEnum.getContainerOfType(CustomField).enumName.saveQuote»
	{
		Extensible = true;
		
		«FOR member : typeEnum.members»
			value(«management.getNewFieldNo(typeEnum)»; "«member»") { Caption = '«member»'; }
		«ENDFOR»
	}
	'''
	
}
