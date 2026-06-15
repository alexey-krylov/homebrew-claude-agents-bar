class ClaudeAgentsBar < Formula
  desc "Menu-bar widget for tracking parallel Claude Code sessions"
  homepage "https://github.com/alexey-krylov/ClaudeAgentsBar"
  license "MIT"

  url "https://github.com/alexey-krylov/ClaudeAgentsBar/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "fa86b8a6aff85a51d7f01d59c4731ce4994a22d4b267bf1ec5864d7ccbc73933"

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
    assert_match "claude-agents-bar 1.2.2",
                 shell_output("#{bin}/claude-agents-bar version")
  end
end
