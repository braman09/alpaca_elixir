# This file contains the configuration for Credo and you are probably reading
# this after creating it with `mix credo.gen.config`.
#
# If you find anything wrong or unclear in this file, please report an
# issue on GitHub: https://github.com/rrrene/credo/issues
#
%{
  #
  # You can have as many configs as you like in the `configs:` field.
  configs: [
    %{
      #
      # Run any exec using `mix credo -C <name>`. If no exec name is given
      # "default" is used.
      #
      name: "default",
      #
      # These are the files included in the analysis:
      files: %{
        included: ["lib/", "src/", "web/", "apps/"],
        excluded: [~r"/_build/", ~r"/deps/"]
      },
      #
      # If you create your own checks, you must specify the source files for
      # them here, so they can be loaded by Credo before running the analysis.
      #
      requires: [],
      #
      # If you want to enforce a style guide and need a more traditional linting
      # experience, you can change `strict` to `true` below:
      #
      strict: true,
      #
      # If you want to use uncolored output by default, you can change `color`
      # to `false` below:
      #
      color: true,
      #
      # You can customize the parameters of any check by adding a second element
      # to the tuple.
      #
      # To disable a check put `false` as second element:
      #
      #     {Credo.Check.Design.DuplicatedCode, false}
      #
      checks: [
        #
        ## Consistency Checks
        #
        # Exception names do not necessarily need to end with Error.
        {Credo.Check.Consistency.ExceptionNames, false},
        # mix format handles this.
        {Credo.Check.Consistency.LineEndings, false},
        {Credo.Check.Consistency.ParameterPatternMatching, []},
        # mix format handles this.
        {Credo.Check.Consistency.SpaceAroundOperators, false},
        # mix format handles this.
        {Credo.Check.Consistency.SpaceInParentheses, false},
        # mix format handles this.
        {Credo.Check.Consistency.TabsOrSpaces, false},

        #
        ## Design Checks
        #
        # You can customize the priority of any check
        # Priority values are: `low, normal, high, higher`
        #
        {Credo.Check.Design.AliasUsage,
         [priority: :low, if_nested_deeper_than: 3, if_called_more_often_than: 2]},
        # Off for now, we can revisit later.
        {Credo.Check.Readability.UnnecessaryAliasExpansion, false},
        # We use TODO and FIXME everywhere, no point in flagging them right now.
        {Credo.Check.Design.TagTODO, false},
        {Credo.Check.Design.TagFIXME, false},

        #
        ## Readability Checks
        #
        # Disabled until we find a way to do that automatically.
        {Credo.Check.Readability.AliasOrder, false},
        {Credo.Check.Readability.FunctionNames, []},
        # mix format handles this.
        {Credo.Check.Readability.LargeNumbers, false},
        # mix format handles this.
        {Credo.Check.Readability.MaxLineLength, false},
        {Credo.Check.Readability.ModuleAttributeNames, []},
        {Credo.Check.Readability.ModuleDoc, []},
        {Credo.Check.Readability.ModuleNames, []},
        {Credo.Check.Readability.ParenthesesInCondition, []},
        # Parentheses everywhere is mix format standard.
        {Credo.Check.Readability.ParenthesesOnZeroArityDefs, false},
        {Credo.Check.Readability.PredicateFunctionNames, []},
        # Explicit is better than implicit.
        {Credo.Check.Readability.PreferImplicitTry, false},
        # mix format handles this.
        {Credo.Check.Readability.RedundantBlankLines, false},
        {Credo.Check.Readability.Semicolons, []},
        # mix format handles this.
        {Credo.Check.Readability.SpaceAfterCommas, false},
        {Credo.Check.Readability.StringSigils, []},
        {Credo.Check.Readability.TrailingBlankLine, []},
        # mix format handles this.
        {Credo.Check.Readability.TrailingWhiteSpace, false},
        {Credo.Check.Readability.VariableNames, []},

        #
        ## Refactoring Opportunities
        #
        {Credo.Check.Refactor.CondStatements, []},
        # This doesn't estimate properly functions complexity,
        # e.g. long simple mapping function for parsing are flagged.
        {Credo.Check.Refactor.CyclomaticComplexity, false},
        {Credo.Check.Refactor.FunctionArity, []},
        # Some of our systems macros have big quote blocks that can't be easily broken
        {Credo.Check.Refactor.LongQuoteBlocks, false},
        # Obsolete in Elixir 1.8+.
        {Credo.Check.Refactor.MapInto, false},
        {Credo.Check.Refactor.MatchInCondition, []},
        {Credo.Check.Refactor.NegatedConditionsInUnless, []},
        {Credo.Check.Refactor.NegatedConditionsWithElse, []},
        {Credo.Check.Refactor.Nesting, []},
        {Credo.Check.Refactor.PipeChainStart,
         [
           excluded_argument_types: [:atom, :binary, :fn, :keyword, :number],
           # It is frequent to pipe an Ecto.Query query into a Repo function.
           excluded_functions: ["from", "Multi.new", "Brex.Multi.new"]
         ]},
        {Credo.Check.Refactor.UnlessWithElse, []},
        {Credo.Check.Refactor.WithClauses, false},

        #
        ## Warnings
        #
        {Credo.Check.Warning.BoolOperationOnSameValues, []},
        {Credo.Check.Warning.ExpensiveEmptyEnumCheck, []},
        {Credo.Check.Warning.IExPry, []},
        {Credo.Check.Warning.IoInspect, []},
        # LazyLogging is not compatible with our version of elixir (requires < 1.7.0)
        {Credo.Check.Warning.LazyLogging, false},
        {Credo.Check.Warning.OperationOnSameValues, []},
        {Credo.Check.Warning.OperationWithConstantResult, []},
        {Credo.Check.Warning.RaiseInsideRescue, []},
        {Credo.Check.Warning.UnusedEnumOperation, []},
        {Credo.Check.Warning.UnusedFileOperation, []},
        {Credo.Check.Warning.UnusedKeywordOperation, []},
        {Credo.Check.Warning.UnusedListOperation, []},
        {Credo.Check.Warning.UnusedPathOperation, []},
        {Credo.Check.Warning.UnusedRegexOperation, []},
        {Credo.Check.Warning.UnusedStringOperation, []},
        {Credo.Check.Warning.UnusedTupleOperation, []},

        #
        # Controversial and experimental checks (opt-in, just replace `false` with `[]`)
        #
        {Credo.Check.Consistency.MultiAliasImportRequireUse, false},
        {Credo.Check.Design.DuplicatedCode, false},
        {Credo.Check.Readability.Specs, false},
        {Credo.Check.Refactor.ABCSize, false},
        {Credo.Check.Refactor.AppendSingleItem, false},
        {Credo.Check.Refactor.DoubleBooleanNegation, false},
        # Apparently undefined?
        # {Credo.Check.Refactor.ModuleDependencies, false},
        {Credo.Check.Refactor.VariableRebinding, false},
        {Credo.Check.Warning.MapGetUnsafePass, false}

        # Apparently undefined?
        # {Credo.Check.Warning.UnsafeToAtom, false}

        #
        # Custom checks can be created using `mix credo.gen.check`.
        #
      ]
    }
  ]
}