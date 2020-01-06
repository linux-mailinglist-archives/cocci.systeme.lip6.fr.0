Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4082C131214
	for <lists+cocci@lfdr.de>; Mon,  6 Jan 2020 13:20:58 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 006CKfRT018962;
	Mon, 6 Jan 2020 13:20:41 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6D6667718;
	Mon,  6 Jan 2020 13:20:41 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id F04157718
 for <cocci@systeme.lip6.fr>; Mon,  6 Jan 2020 13:20:39 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 006CKdN4017888
 for <cocci@systeme.lip6.fr>; Mon, 6 Jan 2020 13:20:39 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,402,1571695200"; d="scan'208";a="430045058"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 13:20:39 +0100
Date: Mon, 6 Jan 2020 13:20:39 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <7ddf003e-956c-b146-55f5-7a68f263d5c8@web.de>
Message-ID: <alpine.DEB.2.21.2001061319580.2920@hadrien>
References: <20200103160304.GG17258@pobox.com>
 <08d3a32e-7adc-ff5b-52d0-9e67ed03ae42@web.de>
 <alpine.DEB.2.21.2001051100550.2579@hadrien>
 <7ddf003e-956c-b146-55f5-7a68f263d5c8@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 06 Jan 2020 13:20:41 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 06 Jan 2020 13:20:39 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Adding semicolons after macro calls
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



On Mon, 6 Jan 2020, Markus Elfring wrote:

> > The only short term suggestion I have is the following:
>
> I wonder about the specification of two statement variables here.
>
>
> Under which circumstances can a transformation approach (like the following)
> work as desired?
>
> @addition@
> identifier action;
> statement s;
> @@
>  <+...
>  action(...)
> +;
>  s
>  ...+>

Currently none.  The SmPL language doesn't support statements that look
like function calls but have no following ;

julia

>
> elfring@Sonne:~/Projekte/Coccinelle/Probe> spatch --parse-cocci add_semicolon_behind_call1.cocci
> init_defs_builtins: /usr/local/bin/../lib/coccinelle/standard.h
> minus: parse error:
>   File "add_semicolon_behind_call1.cocci", line 8, column 1, charpos = 70
>   around = 's',
>   whole content =  s
>
>
> How will further improvements be achieved for data processing around macro calls?
>
> Regards,
> Markus
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
