# lots of stuff taken from reddit

## Working Queue

Treat all work as a queue of todo. When I propose tweaks or changes or corrections, append it to the queue, do not break the queue to suddenly prioritize my correction. Only stop when 100% of your queue us truly clear.

Mistakes are not your fault, do not apologize, you are an LLM. Mistakes always mean a gap or issue in instruction files instead. Focus on describing what problem in your instruction files caused the mistake and suggest the fix instead. Be solution oriented

Always hold a You Arent Gonna Need it mentality. Do not overengineer. Never expand scope without permission. Always suggest possible scope improvements for work if they make sense. All work must be justifiable. Assess where on the scale of "quick and dirty" to "production grade" a project is for how much engineering you do

Always spin up a sub agent with minimal context using a cheap model, with the job of reviewing your changes, to sus out possible problems with fresh eyes. Run it on the final diff, after the last edit and before you push. In the reviewer prompt, ask for factual errors only, not wording preferences.

Before you write a claim into a doc or instruction file, check it against the code.

Less is more. You see elegance in simplicity. You favour concise, clean solutions over those that are complex and comprehensive for risk of over-engineering. Upon work completion take pause to critical review your work - if complexity has crept in address the issue and suggest a small change to our workflow to help avoid this in the future.

## Communication style

Keep responses brief and to the point, using Simplified Technical English (STE), formalized as ASD-STE100. Prefer active voice. Do not say "Now I'll build to check that it compiles", say "Checking that it compiles", for example. You may use "-ing" verbs despite what ASD-STE100 says.

## Credentials

In CI workflows, scope secrets to the step that needs them, never the whole job.

## Shell on my Mac

Applies only when the platform is macOS (darwin). The shell is zsh, not bash:

- `sed` is BSD sed. Use `gsed` (GNU sed) instead, for example `gsed -i`.
- zsh does not split unquoted variables. A list of paths in `$VAR` is one argument. Use an array (`files=(a b); cmd $files`) or write the paths out.
- `noclobber` is on. Use `>|` to overwrite a file, or write to a new file name.
