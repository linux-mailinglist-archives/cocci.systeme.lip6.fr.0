Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0798E2C7029
	for <lists+cocci@lfdr.de>; Sat, 28 Nov 2020 18:46:20 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0ASHjpoE001728;
	Sat, 28 Nov 2020 18:45:51 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 065F377C0;
	Sat, 28 Nov 2020 18:45:51 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0C788454B
 for <cocci@systeme.lip6.fr>; Sat, 28 Nov 2020 18:45:49 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0ASHjms7026218
 for <cocci@systeme.lip6.fr>; Sat, 28 Nov 2020 18:45:48 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,377,1599516000"; d="scan'208";a="365945537"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2020 18:45:48 +0100
Date: Sat, 28 Nov 2020 18:45:47 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <13b38013-8d4f-55fa-3c0e-ead782031659@web.de>
Message-ID: <alpine.DEB.2.22.394.2011281844070.2725@hadrien>
References: <13b38013-8d4f-55fa-3c0e-ead782031659@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-635358495-1606585548=:2725"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 28 Nov 2020 18:45:52 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 28 Nov 2020 18:45:48 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking the influence of an omitted semicolon on a
 code adjustment
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

--8323329-635358495-1606585548=:2725
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sat, 28 Nov 2020, Markus Elfring wrote:

> Hello,
>
> The following small SmPL script gets successfully parsed by the Coccinelle software.
>
>
> @Replacement@
> expression call, input, target;
> identifier gs;
> @@
> -\( g_string_assign@gs \| g_string_append@gs \) (target, input);
>  call (
> -      target
> +      gs (target, input)
>       );
>
>
> But if I would like to omit the semicolon in the last line, I stumble on
> the error message “incompatible minus and plus code starting on lines 5 and 6”.
> Can such a software limitation be adjusted?

Why do you want to remove the semicolon?

If you want to find the call somewhere in the next statement, you can say

(
S
&
call(
  ...
  )
)

where S is a statement metavariable.  I'm not sure what will happen if
there are two occurrences of call in the statement.

julia
--8323329-635358495-1606585548=:2725
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-635358495-1606585548=:2725--
