Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C8F25663A
	for <lists+cocci@lfdr.de>; Sat, 29 Aug 2020 11:16:30 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07T9GDo7021729;
	Sat, 29 Aug 2020 11:16:13 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 017AB77BF;
	Sat, 29 Aug 2020 11:16:12 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 642F33F6C
 for <cocci@systeme.lip6.fr>; Sat, 29 Aug 2020 11:16:11 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07T9GAng014772
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 29 Aug 2020 11:16:10 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,359,1592863200"; d="scan'208";a="357577834"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2020 11:16:10 +0200
Date: Sat, 29 Aug 2020 11:16:10 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <75644b75-443c-1da9-fd1b-35e2ce34cf47@web.de>
Message-ID: <alpine.DEB.2.22.394.2008291113140.3629@hadrien>
References: <75644b75-443c-1da9-fd1b-35e2ce34cf47@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1586068307-1598692570=:3629"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 29 Aug 2020 11:16:13 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 29 Aug 2020 11:16:11 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>, Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [Cocci] Checking the deletion of a multiplication operator with
 SmPL
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1586068307-1598692570=:3629
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sat, 29 Aug 2020, Markus Elfring wrote:

> Hello,
>
> The following small script variant for the semantic patch language gets accepted
> according to the software combination “Coccinelle 1.0.8-00159-g730dbb03”.
>
> @replacement@
> identifier array, instance, size;
> type T;
> @@
> (
> -sizeof(T)
> |
> -sizeof(*instance->array)
> )
>  *
> +flex_array_size(instance, array,
>                  instance->size
> +               )

This semantic patch will fail if the sizeof(T) option is matched, becuse
then it won't be able to create the + code, since it won't know what array
should be.

>
>
> But I observe data processing difficulties if I would like to mark
> the multiplication operator also for deletion (on a separate line).
>
> elfring@Sonne:~/Projekte/Coccinelle/Probe> spatch --parse-cocci flex_array_size-test2-20200829.cocci
> init_defs_builtins: /usr/local/bin/../lib/coccinelle/standard.h
> File "flex_array_size-test2-20200829.cocci", line 10, column 1, charpos = 103
>   around = '*',
>   whole content = -*
>
>
> Can such a transformation specification become supported?

This doens't work because you have no space beterrn the - and the *.  The
characters - + * ? ( ) | and & are treated in a special way in column 0,
and more generally when there is no whitespace before them in the line.

julia
--8323329-1586068307-1598692570=:3629
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1586068307-1598692570=:3629--
