Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B153832D4D
	for <lists+cocci@lfdr.de>; Mon,  3 Jun 2019 12:00:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x539xRDa008947;
	Mon, 3 Jun 2019 11:59:27 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 735A17760;
	Mon,  3 Jun 2019 11:59:27 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 1298F3F9C
 for <cocci@systeme.lip6.fr>; Mon,  3 Jun 2019 11:59:26 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x539xP19011603
 for <cocci@systeme.lip6.fr>; Mon, 3 Jun 2019 11:59:25 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,546,1549926000"; d="scan'208";a="307947123"
Received: from 206.201.158.77.rev.sfr.net (HELO DESKTOP-869AK4J.localdomain)
 ([77.158.201.206])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 11:59:25 +0200
Date: Mon, 3 Jun 2019 11:59:24 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: =?ISO-8859-15?Q?Christoph_B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <a2f5f688-c082-0b81-b7b7-5bbb83beae0d@linbit.com>
Message-ID: <alpine.DEB.2.21.1906031158400.2520@hadrien>
References: <a2f5f688-c082-0b81-b7b7-5bbb83beae0d@linbit.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1398292159-1559555965=:2520"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 03 Jun 2019 11:59:28 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Mon, 03 Jun 2019 11:59:25 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Indentation when adding an if
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

--8323329-1398292159-1559555965=:2520
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT



On Mon, 3 Jun 2019, Christoph Böhmwalder wrote:

> Hi,
>
> Consider the following C code and cocci patch:
>
> #include <stdio.h>
>
> int x;
>
> int main(int argc, char **argv)
> {
>     if (y)
>         do_something(x);
> }
>
>
> @@
> identifier x;
> @@
> - do_something(x);
> + if (x)
> +	do_one_thing();
> + else
> +	do_another_thing();
>
>
> For this input, spatch produces the following output:
>
>
> $ spatch --sp-file test.cocci test.c
> init_defs_builtins: /usr/lib/coccinelle/standard.h
> HANDLING: test.c
> diff =
> --- test.c
> +++ /tmp/cocci-output-18011-a28e99-test.c
> @@ -5,5 +5,8 @@ int x;
>  int main(int argc, char **argv)
>  {
>      if (y)
> -        do_something(x);
> +        if (x)
> +            do_one_thing();
> +    else
> +        do_another_thing();
>  }
>
>
> Obviously it gets the indentation wrong there. Is this a bug?
>
> Adding curly braces around the outer if (in the C code) yields the correct
> indentation, while adding the braces around the inner if (in the cocci patch)
> does not.
>
> Adding an else branch to the outer if also produces the wrong indentation.

This is surely a bug.  Thank you for the report.

julia
--8323329-1398292159-1559555965=:2520
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1398292159-1559555965=:2520--
