Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D371511D3
	for <lists+cocci@lfdr.de>; Mon,  3 Feb 2020 22:31:35 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 013LVBxI001119;
	Mon, 3 Feb 2020 22:31:11 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E15CD77F7;
	Mon,  3 Feb 2020 22:31:10 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C1434772B
 for <cocci@systeme.lip6.fr>; Mon,  3 Feb 2020 22:31:09 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 013LV91r028633
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 3 Feb 2020 22:31:09 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,398,1574118000"; d="scan'208";a="434276066"
Received: from abo-208-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.208])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 22:31:09 +0100
Date: Mon, 3 Feb 2020 22:31:08 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <b318a372-2f31-f57f-4684-62ac2b82bff3@web.de>
Message-ID: <alpine.DEB.2.21.2002032230210.3356@hadrien>
References: <72729ef6-f8df-942f-57aa-4b3fac75a20d@web.de>
 <alpine.DEB.2.21.2002032151520.3356@hadrien>
 <b318a372-2f31-f57f-4684-62ac2b82bff3@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1021981060-1580765469=:3356"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 03 Feb 2020 22:31:11 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 03 Feb 2020 22:31:09 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Wellington Wallace <wellingtonwallace@gmail.com>,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Replacing a std::string check by strcmp() with SmPL
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

--8323329-1021981060-1580765469=:3356
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Mon, 3 Feb 2020, Markus Elfring wrote:

> > Where is the space that yoyu are concerned about?
>
> …
> @@ -1,7 +1,7 @@
>  void on_message_element …
> ↑
>
> How was this character added at the first column in this line
> of my software test approach?

I don't understand.  If you are showing a patch, then the first column is
empty, except for the - and + characters.

julia

>
>
> >>    https://github.com/wwmm/pulseeffects/blob/acb5161a6ab8d3b0c395ed2809d3318ccf4931bc/src/source_output_effects.cpp#L6
> >
> > I guess it would be fine if you put
> >
> > typedef auto;
> >
> > among the metavariables?
>
> Do you distinguish between the storage class specifier
> and other uses of such a key word?
> https://en.cppreference.com/w/cpp/language/auto
>
> Regards,
> Markus
>
--8323329-1021981060-1580765469=:3356
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1021981060-1580765469=:3356--
