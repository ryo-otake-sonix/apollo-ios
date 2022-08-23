import Foundation
import PackagePlugin

@main struct CodegenPlugin: CommandPlugin {
  func performCommand(context: PluginContext, arguments: [String]) async throws {
    let tool = try context.tool(named: "CodegenCLI")
    let toolExecUrl = URL(fileURLWithPath: tool.path.string)

    let process = try Process.run(toolExecUrl, arguments: ["generate"])
    process.waitUntilExit()    
  }
}
