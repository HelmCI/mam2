(function ($) {
    console.log('Use GIT=1 if need updates')
    const originalEnsure = $.$mol_build_ensure_vcs.prototype.ensure;
    $.$mol_build_ensure_vcs.prototype.ensure = function (path) {
        if (!this.$.$mol_env()['GIT']) return false;
        return originalEnsure.call(this, path);
    };
})($ || ($ = {}));
