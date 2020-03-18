Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A061518A296
	for <lists+cocci@lfdr.de>; Wed, 18 Mar 2020 19:49:13 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02IIn1Of006760;
	Wed, 18 Mar 2020 19:49:01 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0F175781F;
	Wed, 18 Mar 2020 19:49:01 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8B4C277F9
 for <cocci@systeme.lip6.fr>; Wed, 18 Mar 2020 19:48:59 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02IImxMr028169
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 18 Mar 2020 19:48:59 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,568,1574118000"; d="scan'208";a="441037722"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 19:48:58 +0100
Date: Wed, 18 Mar 2020 19:48:58 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200316100319.27935-27-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2003181948430.2979@hadrien>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
 <20200316100319.27935-27-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 18 Mar 2020 19:49:01 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 18 Mar 2020 19:48:59 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 26/26] tests: Add test case for array of
 function pointers
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



On Mon, 16 Mar 2020, Jaskaran Singh wrote:

> Add a test case to match against an array of function pointers.
> This would previously not work due to differences in the C
> and SmPL ASTs.
>

Thanks for all of the changes in this series!

julia

> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  tests/funptr_array.c     | 1 +
>  tests/funptr_array.cocci | 9 +++++++++
>  tests/funptr_array.res   | 1 +
>  3 files changed, 11 insertions(+)
>  create mode 100644 tests/funptr_array.c
>  create mode 100644 tests/funptr_array.cocci
>  create mode 100644 tests/funptr_array.res
>
> diff --git a/tests/funptr_array.c b/tests/funptr_array.c
> new file mode 100644
> index 00000000..dac29ac6
> --- /dev/null
> +++ b/tests/funptr_array.c
> @@ -0,0 +1 @@
> +int (*x[2])(int x);
> diff --git a/tests/funptr_array.cocci b/tests/funptr_array.cocci
> new file mode 100644
> index 00000000..8027bcf4
> --- /dev/null
> +++ b/tests/funptr_array.cocci
> @@ -0,0 +1,9 @@
> +@@
> +type T;
> +identifier x;
> +@@
> +
> +T (*x[2])(
> +- int
> ++ char
> +  x);
> diff --git a/tests/funptr_array.res b/tests/funptr_array.res
> new file mode 100644
> index 00000000..72e1a14a
> --- /dev/null
> +++ b/tests/funptr_array.res
> @@ -0,0 +1 @@
> +int (*x[2])(char x);
> --
> 2.21.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
