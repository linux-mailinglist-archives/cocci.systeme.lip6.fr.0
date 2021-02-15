Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35C31B84C
	for <lists+cocci@lfdr.de>; Mon, 15 Feb 2021 12:48:07 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11FBlgCf019759;
	Mon, 15 Feb 2021 12:47:42 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6D5E5376A;
	Mon, 15 Feb 2021 12:47:42 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id EDD86376A
 for <cocci@systeme.lip6.fr>; Mon, 15 Feb 2021 12:47:39 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11FBldga008728
 for <cocci@systeme.lip6.fr>; Mon, 15 Feb 2021 12:47:39 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,180,1610406000"; d="scan'208";a="493033741"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 12:47:39 +0100
Date: Mon, 15 Feb 2021 12:47:39 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <f3aefcce-4ba1-f49a-c47a-fb6e7a164a19@linux.com>
Message-ID: <alpine.DEB.2.22.394.2102151246510.2808@hadrien>
References: <f3aefcce-4ba1-f49a-c47a-fb6e7a164a19@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 15 Feb 2021 12:47:42 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 15 Feb 2021 12:47:39 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Problem with partial patch generation
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr



On Mon, 15 Feb 2021, Denis Efremov wrote:

> Hi,
>
> I wrote a simple rule (swap.cocci):
>
> virtual patch
>
> @depends on patch@
> identifier tmp;
> expression a, b;
> type T;
> @@
>
> (
> - T tmp;
> |
> - T tmp = 0;
> |
> - T *tmp = NULL;
> )
> ... when != tmp
> - tmp = a;
> - a = b;
> - b = tmp;
> + swap(a, b);
> ... when != tmp
>
> I would expect it to remove a local variable only if there is a match
> with swap template.
>
> However, it generates "partial" patch on 5.11 linux code:
> $ spatch --version
> spatch version 1.0.8-00201-g267f9cf8cc82 compiled with OCaml version 4.11.1
> $ spatch -D patch --sp-file swap.cocci mm/filemap.c
> --- mm/filemap.c
> +++ /tmp/cocci-output-445786-88aa66-filemap.c
> @@ -2348,7 +2348,7 @@ static int generic_file_buffered_read_ge
>         struct file_ra_state *ra = &filp->f_ra;
>         pgoff_t index = iocb->ki_pos >> PAGE_SHIFT;
>         pgoff_t last_index = (iocb->ki_pos + iter->count + PAGE_SIZE-1) >> PAGE_SHIFT;
> -       int i, j, nr_got, err = 0;
> +       int i, nr_got, err = 0;
>
>         nr = min_t(unsigned long, last_index - index, nr);
>  find_page:
>
> How can I improve the rule?

I don't get a match with the latest version of Coccinelle.

If the latest version of Coccinelle were to become a release, would that
be good enough for you?  Or do you need 1.0.8 to work as well?

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
