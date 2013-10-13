{if $messages}
<div id="messages">
{section name=i loop=$messages}
{$messages[i]}<br />
{/section}
</div>
{/if}