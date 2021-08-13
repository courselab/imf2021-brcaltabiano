	.text
	.global change
change: 
	push   %ebp
	mov    %esp,%ebp
	add    $0x2d82,%eax
	mov    0x8(%ebp),%edx
	mov    0xc(%ebp),%eax
	add    %eax,%edx
	mov    %edx,%eax
	sar    $0x1f,%eax
	shr    $0x18,%eax
	add    %eax,%edx
	movzbl %dl,%edx
	sub    %eax,%edx
	mov    %edx,%eax
	pop    %ebp
	ret    $0x10
