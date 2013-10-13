{if $errors}
<div id="errors">
{section name=i loop=$errors}
{$errors[i]}<br />
{/section}
</div>
{/if}