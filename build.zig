const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addModule("zide_tree_sitter", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    _ = lib;

    const tests = b.addTest(.{
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/root.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });
    const run_tests = b.addRunArtifact(tests);

    const test_step = b.step("test", "Run package tests");
    test_step.dependOn(&run_tests.step);

    const grammar_update = b.addExecutable(.{
        .name = "grammar-update",
        .root_module = b.createModule(.{
            .root_source_file = b.path("tools/grammar/grammar_update.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });
    const grammar_update_run = b.addRunArtifact(grammar_update);
    if (b.args) |args| grammar_update_run.addArgs(args);
    const grammar_update_step = b.step("grammar-update", "Build and install Tree-sitter grammar packs");
    grammar_update_step.dependOn(&grammar_update_run.step);

    const grammar_fetch = b.addExecutable(.{
        .name = "grammar-fetch",
        .root_module = b.createModule(.{
            .root_source_file = b.path("tools/grammar/grammar_fetch.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });
    const grammar_fetch_run = b.addRunArtifact(grammar_fetch);
    if (b.args) |args| grammar_fetch_run.addArgs(args);
    const grammar_fetch_step = b.step("grammar-fetch", "Fetch Tree-sitter grammar sources");
    grammar_fetch_step.dependOn(&grammar_fetch_run.step);
}
