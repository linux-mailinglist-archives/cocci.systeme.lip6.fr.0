Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 241171FFC42
	for <lists+cocci@lfdr.de>; Thu, 18 Jun 2020 22:06:38 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05IK6La4007417;
	Thu, 18 Jun 2020 22:06:21 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 264D1781F;
	Thu, 18 Jun 2020 22:06:21 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id DA5EA402B
 for <cocci@systeme.lip6.fr>; Thu, 18 Jun 2020 22:06:19 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05IK6JZM011432
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 18 Jun 2020 22:06:19 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,252,1589234400"; d="scan'208";a="455482599"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 22:06:19 +0200
Date: Thu, 18 Jun 2020 22:06:19 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: NICOLAS PALIX <nicolas.palix@univ-grenoble-alpes.fr>
In-Reply-To: <1173488313.3947218.1592510475320.JavaMail.zimbra@univ-grenoble-alpes.fr>
Message-ID: <alpine.DEB.2.22.394.2006182206020.2367@hadrien>
References: <159250651644.6245.11738703319415468670.launchpad@haetae.canonical.com>
 <1173488313.3947218.1592510475320.JavaMail.zimbra@univ-grenoble-alpes.fr>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-560310394-1592510779=:2367"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 18 Jun 2020 22:06:21 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 18 Jun 2020 22:06:19 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>, calderon.thomas@gmail.com
Subject: Re: [Cocci] Fwd: [~npalix/ubuntu/coccinelle/focal] coccinelle
 1.0.8~20.04npalix1 (Accepted)
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

--8323329-560310394-1592510779=:2367
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 18 Jun 2020, NICOLAS PALIX wrote:

> Hi,
>
> I released the 1.0.8 version ported to 20.04 focal
> on the coccinelle PPA.

Thanks!

julia


>
> Regards,
>
> __________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
> De: "Launchpad PPA" <no_reply@launchpad.net>
> À: "Nicolas Palix" <nicolas.palix@imag.fr>
> Envoyé: Jeudi 18 Juin 2020 20:55:16
> Objet: [~npalix/ubuntu/coccinelle/focal] coccinelle 1.0.8~20.04npalix1 (Accepted)
>
> Accepted:
>  OK: coccinelle_1.0.8~20.04npalix1.tar.xz
>  OK: coccinelle_1.0.8~20.04npalix1.dsc
>      -> Component: main Section: devel
>
> coccinelle (1.0.8~20.04npalix1) focal; urgency=medium
>
>   * New release 1.0.8
>
> --
> https://launchpad.net/~npalix/+archive/ubuntu/coccinelle
> You are receiving this email because you made this upload.
>
>
--8323329-560310394-1592510779=:2367
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-560310394-1592510779=:2367--
