class ClaudeAgentsBar < Formula
  desc "Menu-bar widget for tracking parallel Claude Code sessions"
  homepage "https://github.com/alexey-krylov/ClaudeAgentsBar"
  license "MIT"

  url "https://github.com/alexey-krylov/ClaudeAgentsBar/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "46505b0c59986521ff0741db0523fa77f00956e5c5ddf44eebfe31cf68c59c87"

  head "https://github.com/alexey-krylov/ClaudeAgentsBar.git", branch: "main"

  depends_on "jq"
  depends_on :macos

  def install
    # Bundle the plugin, its hook, helper scripts, locales and example
    # config under libexec/. Then expose the single CLI entrypoint.
    libexec.install "claude-agents.5s.py", "config.example.json",
                    "claude_agents_bar", "hooks", "bin", "locales", "LICENSE"
    bin.install_symlink libexec/"bin/claude-agents-bar"
  end

  def caveats
    <<~EOS
      To finish setup (symlink the SwiftBar plugin, register the Claude
      Code hook, and merge ~/.claude/settings.json — with backup), run:

          claude-agents-bar setup

      To undo:

          claude-agents-bar teardown

      SwiftBar is a runtime prerequisite and must be installed separately:

          brew install --cask swiftbar

      Verify deps any time with:

          claude-agents-bar doctor
    EOS
  end

  test do
    assert_match "claude-agents-bar 1.3.0",
                 shell_output("#{bin}/claude-agents-bar version")
  end
end
